
# Optimal Mean Reversion Trading with an AR(1) Process and Fixed Costs

This document outlines an optimal trading strategy for a single asset whose price follows a discrete-time AR(1) process. The strategy is derived from a single-period Mean-Variance Optimization (MVO) framework and explicitly incorporates fixed transaction costs.

### 1. The Model

#### Asset Price Dynamics: AR(1) Process

We model the change in the asset price, $S_t$, using a first-order autoregressive (AR(1)) process, which captures mean reversion:

$$ S_{t+1} - S_t = \alpha(\mu - S_t) + \epsilon_{t+1} $$

Where:
- $S_t$: The price of the asset at time $t$.
- $\mu$: The long-term mean price to which the asset reverts.
- $\alpha$: The speed of mean reversion, where $0 < \alpha < 1$.
- $\epsilon_{t+1}$: A white noise shock term with $E[\epsilon_{t+1}] = 0$ and variance $Var(\epsilon_{t+1}) = \sigma_{\epsilon}^2$.

#### One-Period Ahead Return & Risk

Given the price at time $t$, the conditional expected return and variance for the next period ($t+1$) are:

- **Expected Return**: $ E_t[R_{t+1}] = \alpha(\mu - S_t) $
- **Variance of Return**: $ Var_t(R_{t+1}) = \sigma_{\epsilon}^2 $

### 2. Optimal Allocation with Transaction Costs

The strategy involves defining a **no-trade zone** around the frictionless optimal allocation. A trade is executed only when the current holding falls outside this zone. Let $h_{t-}$ be the holding *before* a potential trade at time $t$, and let $c$ be the fixed transaction cost per unit traded. The investor's risk aversion is given by $\gamma$.

#### Boundary Formulas

The no-trade zone is an interval $[L(S_t), U(S_t)]$ defined by a lower (buy) boundary and an upper (sell) boundary.

- **Lower Boundary (Buy Threshold) $L(S_t)$**:
  $$ L(S_t) = \frac{E_t[R_{t+1}] - c}{\gamma \sigma_{\epsilon}^2} = \frac{\alpha(\mu - S_t) - c}{\gamma \sigma_{\epsilon}^2} $$

- **Upper Boundary (Sell Threshold) $U(S_t)$**:
  $$ U(S_t) = \frac{E_t[R_{t+1}] + c}{\gamma \sigma_{\epsilon}^2} = \frac{\alpha(\mu - S_t) + c}{\gamma \sigma_{\epsilon}^2} $$

The width of this no-trade zone is constant: $U(S_t) - L(S_t) = \frac{2c}{\gamma \sigma_{\epsilon}^2}$.

#### Complete Trading Rules

The optimal allocation, $h_t$, is determined by the following rules:

1.  **If the current holding is below the zone ($h_{t-} < L(S_t)$):**
    The expected benefit of increasing the position outweighs the cost.
    **Action**: **BUY** to bring the holding up to the lower boundary.
    $$ h_t = L(S_t) $$

2.  **If the current holding is above the zone ($h_{t-} > U(S_t)$):**
    The expected benefit of decreasing the position outweighs the cost.
    **Action**: **SELL** to bring the holding down to the upper boundary.
    $$ h_t = U(S_t) $$

3.  **If the current holding is within the zone ($L(S_t) \le h_{t-} \le U(S_t)$):**
    The expected benefit of a trade is insufficient to cover the cost.
    **Action**: **DO NOT TRADE**.
    $$ h_t = h_{t-} $$

---
### References

**Classic Foundational Work:**

Davis, M. H. A., and Norman, A. R. (1990). "Portfolio Selection with Transaction Costs." *Mathematics of Operations Research*, 15(4), 676–713.

**Modern Extension to Multi-Period and General Costs:**

Mei, X., DeMiguel, V., & Nogales, F. J. (2016). "Multiperiod portfolio optimization with multiple risky assets and general transaction costs." *Available at SSRN 2832387*.
