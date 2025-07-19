# Optimal Trading with Parameter Uncertainty: A Bayesian Approach

This document details how to systematically incorporate parameter uncertainty into a mean-reversion trading strategy using a Bayesian framework. This approach provides a rigorous method for adjusting position sizes based on the degree of confidence in the model's parameters, leading to more robust and conservative trading decisions.

### 1. The Bayesian AR(1) Model

We start with the standard AR(1) model, framed as a linear regression:

$$ S_{t+1} - S_t = \beta_0 + (\beta_1 - 1)S_t + \epsilon_{t+1} $$

Where the goal is to estimate the parameters $\boldsymbol{\beta} = [\beta_0, \beta_1]^T$ and the residual variance $\sigma_\epsilon^2$. By using a **Normal-Inverse-Gamma** conjugate prior for $p(\boldsymbol{\beta}, \sigma_\epsilon^2)$, we can derive a posterior distribution, $p(\boldsymbol{\beta}, \sigma_\epsilon^2 | \text{Data})$, that is also a Normal-Inverse-Gamma distribution. This provides us with analytical, closed-form expressions for the posterior moments of the parameters.

### 2. The Predictive Distribution: The Key Ingredient

To make optimal decisions, we use the full one-step-ahead predictive distribution of the return, $R_{t+1}$. This is found by integrating out the model parameters over their posterior distribution.

#### Predictive Mean

The predictive mean is our best estimate for the next return, averaged over our beliefs about the parameters. Let $\bar{\boldsymbol{\beta}} = E[\boldsymbol{\beta} | \text{Data}]$ be the vector of posterior mean parameters.

$$ E_t[R_{t+1}] = \bar{\beta}_0 + (\bar{\beta}_1 - 1)S_t $$

#### Predictive Variance

Crucially, the total predictive variance is the sum of two distinct components: the inherent randomness of the asset price and our uncertainty about the model's parameters.

$$ Var_t(R_{t+1}) = \underbrace{E[\sigma_\epsilon^2 | \text{Data}]}_{\text{Residual Uncertainty}} + \underbrace{Var(\beta_0 + (\beta_1 - 1)S_t | \text{Data})}_{\text{Parameter Uncertainty}} $$

Let's denote the posterior mean of the residual variance as $\bar{\sigma}_\epsilon^2$. The parameter uncertainty term, $\sigma_{param}^2(S_t)$, can be expanded using the posterior covariance matrix of the parameters, $\Sigma_{\beta}$:

$$ \sigma_{param}^2(S_t) = \begin{pmatrix} 1 & S_t-1 \end{pmatrix} \Sigma_{\beta} \begin{pmatrix} 1 \\ S_t-1 \end{pmatrix} = Var(\beta_0) + (S_t-1)^2Var(\beta_1) + 2(S_t-1)Cov(\beta_0, \beta_1) $$

The total predictive variance is therefore $Var_t(R_{t+1}) = \bar{\sigma}_\epsilon^2 + \sigma_{param}^2(S_t)$.

### 3. Optimal Position Sizing (No Costs)

#### Certainty Equivalence Approach

The standard Bayesian approach replaces the unknown parameters with the moments of the full predictive distribution in the classic MVO formula.

$$ h_t = \frac{E_t[R_{t+1}]}{\gamma \cdot Var_t(R_{t+1})} = \frac{\bar{\beta}_0 + (\bar{\beta}_1 - 1)S_t}{\gamma \cdot (\bar{\sigma}_\epsilon^2 + \sigma_{param}^2(S_t))} $$

This position is naturally more conservative than a non-Bayesian approach, as the denominator is larger due to the inclusion of parameter uncertainty.

#### With Uncertainty Aversion

To add a separate penalty for model risk, we can introduce an **uncertainty aversion** parameter $k \ge 0$. This applies a "haircut" to the expected return based on the standard deviation of the parameter estimates.

$$ h_t = \frac{E_t[R_{t+1}] - k \cdot \sigma_{param}(S_t)}{\gamma \cdot Var_t(R_{t+1})} $$

This provides two distinct levers: $\gamma$ for aversion to price volatility and $k$ for aversion to parameter estimation error.

### 4. Optimal Sizing with Quadratic Transaction Costs

The quadratic cost model retains its elegant closed-form solution. The optimal holding is a weighted average of a **Bayesian target position** ($h^*$) and the previous holding ($h_{t-}$).

Let the Bayesian target $h^*$ be the optimal holding from the no-cost case (either certainty-equivalent or uncertainty-averse).

$$ h_t = \left(\frac{\gamma Var_t(R_{t+1})}{\gamma Var_t(R_{t+1}) + 2\lambda}\right) h^* + \left(\frac{2\lambda}{\gamma Var_t(R_{t+1}) + 2\lambda}\right) h_{t-} $$

This formula beautifully integrates Bayesian estimation with practical trading constraints. The "speed of trading" (the weight on $h^*$) automatically decreases when total predictive variance is high, reflecting a sensible retreat in the face of increased uncertainty.

---

### Key Academic References

*Note: Full access to these articles may require a subscription or purchase.*

1.  **Zellner, A., & Chetty, V. K. (1965). "Prediction and Decision Problems in Regression Models from the Bayesian Point of View."** *Journal of the American Statistical Association*.
    - [Link](https://www.jstor.org/stable/2283290)

2.  **Barberis, N. (2000). "Investing for the Long Run when Returns are Predictable."** *The Journal of Finance*.
    - [Link](https://onlinelibrary.wiley.com/doi/abs/10.1111/0022-1082.00202)

3.  **Avramov, D., & Zhou, G. (2010). "Bayesian portfolio analysis."** *Annual Review of Financial Economics*.
    - [Link](https://www.annualreviews.org/doi/abs/10.1146/annurev.financial.012809.103611)

4.  **Bauder, D., et al. (2018). "Bayesian Inference for the Tangent Portfolio."** *International Journal of Theoretical and Applied Finance*.
    - [Link](https://www.worldscientific.com/doi/abs/10.1142/S021902491850059X)
