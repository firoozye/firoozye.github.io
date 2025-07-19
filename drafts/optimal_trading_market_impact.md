# Optimal Trading with Market Impact Costs

This document extends the single-period Mean-Variance Optimization (MVO) framework to include non-linear transaction costs, specifically market impact. Unlike fixed costs which lead to a "no-trade" zone, convex market impact costs result in a strategy of continuous and smooth trading.

### 1. The General Utility Function

We augment the standard MVO utility by subtracting a cost term that is a function of the trade size. Let:
- $h_t$: The new position (allocation) at time $t$.
- $h_{t-}$: The position held just before trading at time $t$.
- **Turnover**: The size of the trade, defined as $|h_t - h_{t-}|$.
- $\lambda$: A parameter representing the strength of the market impact. Higher $\lambda$ implies higher trading costs.
- $\beta$: The power of the cost function (e.g., $3/2$ or $2$).

The general utility function, $U(h_t)$, to be maximized at each time step is:

$$ U(h_t) = \underbrace{E_t[R_{t+1}] \cdot h_t - \frac{1}{2}\gamma \sigma_{\epsilon}^2 h_t^2}_{\text{Mean-Variance Utility}} - \underbrace{\lambda |h_t - h_{t-}|^{\beta}}_{\text{Market Impact Cost}} $$

The convexity of the cost function for $\beta > 1$ ensures that the marginal cost of trading increases with trade size, which incentivizes smaller, more frequent trades over large, abrupt ones.

---

### 2. Case 1: Market Impact with $|\text{turnover}|^{3/2}$

This model is frequently used in academic literature and is supported by empirical analysis of trade data, often referred to as the "square-root impact law."

#### Utility Function

$$ U(h_t) = E_t[R_{t+1}] \cdot h_t - \frac{1}{2}\gamma \sigma_{\epsilon}^2 h_t^2 - \lambda |h_t - h_{t-}|^{\frac{3}{2}} $$

#### Characterizing the Optimal Solution

To find the optimal holding $h_t$, we take the derivative of the utility function with respect to $h_t$ and set it to zero. This results in a **non-linear equation**:

$$ \frac{\partial U(h_t)}{\partial h_t} = E_t[R_{t+1}] - \gamma \sigma_{\epsilon}^2 h_t - \frac{3}{2}\lambda |h_t - h_{t-}|^{\frac{1}{2}} \cdot \text{sign}(h_t - h_{t-}) = 0 $$

**Strategy and Intuition:**
- **No Closed-Form Solution**: Due to the non-linearity, there is no simple, explicit formula for $h_t$. The optimal allocation must be found at each step using a numerical root-finding algorithm.
- **Partial Adjustment**: The optimal strategy is to always trade towards the frictionless target ($h^* = E_t[R_{t+1}] / (\gamma \sigma_{\epsilon}^2)$), but never to reach it in a single step (unless $h_{t-} = h^*$). You only close a fraction of the gap.
- **No "No-Trade" Zone**: A trade is almost always optimal, however small. The only time no trade occurs is if the prior holding $h_{t-}$ happens to be exactly at the new optimal level.

---

### 3. Case 2: Market Impact with $|\text{turnover}|^2$ (Kyle-like Model)

This model is popular in economic theory due to its mathematical tractability, which allows for a clean, closed-form solution.

#### Utility Function

$$ U(h_t) = E_t[R_{t+1}] \cdot h_t - \frac{1}{2}\gamma \sigma_{\epsilon}^2 h_t^2 - \lambda (h_t - h_{t-})^2 $$

#### Characterizing the Optimal Solution

The quadratic nature of the cost function makes the first-order condition a **linear equation** in $h_t$, which is easily solved.

$$ \frac{\partial U(h_t)}{\partial h_t} = E_t[R_{t+1}] - \gamma \sigma_{\epsilon}^2 h_t - 2\lambda(h_t - h_{t-}) = 0 $$

Solving for $h_t$ yields:

$$ h_t = \frac{E_t[R_{t+1}]}{\gamma \sigma_{\epsilon}^2 + 2\lambda} + \frac{2\lambda}{\gamma \sigma_{\epsilon}^2 + 2\lambda} h_{t-} $$

**Strategy and Intuition:**

This solution has a very elegant and intuitive structure. If we define the frictionless target holding as $h^* = \frac{E_t[R_{t+1}]}{\gamma \sigma_{\epsilon}^2}$, we can rewrite the solution as:

$$ h_t = \left(\frac{\gamma \sigma_{\epsilon}^2}{\gamma \sigma_{\epsilon}^2 + 2\lambda}\right) h^* + \left(\frac{2\lambda}{\gamma \sigma_{\epsilon}^2 + 2\lambda}\right) h_{t-} $$

- **Weighted Average**: The optimal holding $h_t$ is a simple weighted average of the ideal frictionless target $h^*$ and the previous holding $h_{t-}$.
- **Trading Speed**: The fraction of the gap between the current holding and the target that is closed in each period is constant and equal to $\frac{\gamma \sigma_{\epsilon}^2}{\gamma \sigma_{\epsilon}^2 + 2\lambda}$. This term can be interpreted as the "speed of trading."
- **Impact of Costs**: As market impact costs $\lambda$ increase, the weight shifts towards the previous holding $h_{t-}$, leading to slower trading. If $\lambda=0$, the formula collapses to $h_t = h^*$, as expected.

---

### Key References

1.  **Almgren, R., & Chriss, N. (2001). "Optimal Execution of Portfolio Transactions."** *Journal of Risk*, 3(2), 5–40.
    *(Provides a clear, practical framework for optimal execution using a quadratic cost function, forming the basis for many real-world implementations.)*

2.  **Bouchaud, J.-P., Farmer, J. D., & Lillo, F. (2009). "How markets slowly digest changes in supply and demand."** In *Handbook of Financial Markets: Dynamics and Evolution*.
    *(Details the empirical evidence for the square-root price impact law, which motivates the use of the $|\text{turnover}|^{3/2}$ cost function.)*

3.  **Kyle, A. S. (1985). "Continuous Auctions and Insider Trading."** *Econometrica*, 53(6), 1315–1335.
    *(The foundational theoretical paper in market microstructure that justifies a linear price impact model, which corresponds to a quadratic cost of trading.)*
