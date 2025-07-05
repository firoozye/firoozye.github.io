# Math Examples - Corrected Format

## Inline Math
Use single dollar signs for inline math: `$\beta < 0$` renders as $\beta < 0$

## Display Math
Use double dollar signs for display math:

```markdown
$$\Delta y_t = \beta y_{t-1} + \gamma_1 \Delta y_{t-1} + \gamma_2 \Delta y_{t-2} + \ldots + \gamma_k \Delta y_{t-k}$$
```

## Aligned Equations
Instead of `eqnarray*`, use `align*` (more modern and reliable):

```markdown
$$
\begin{align}
y_t &= \mu_t + \epsilon_t\\
\mu_{t} &= \mu_{t-1} + \delta_t
\end{align}
$$
```

## Text in Math
For text within math expressions, use `\text{}`:

```markdown
$$\text{ADF} = \frac{\int W(t)dW(t)}{\int W^2(t)dt}$$
```

Instead of `\hbox{}` which can cause issues.

## Variance and Other Operators
```markdown
$$\text{Var}(y_{t+k}-y_t) = k \sigma^2$$
```

## Limits and Infinity
```markdown
$$T \rightarrow \infty$$
```

## Complete Example for Your KPSS Section
```markdown
The standard version is based on a state-space model:

$$
\begin{align}
y_t &= \mu_t + \epsilon_t\\
\mu_{t} &= \mu_{t-1} + \delta_t
\end{align}
$$

where typically we assume $\epsilon_t \sim N(0,\sigma_\epsilon^2)$ and $\delta_t \sim N(0,\sigma_\delta^2)$.

The test statistic is:

$$\text{KPSS} = \frac{1}{T^2} \sum_{t=1}^T \left(\sum_{s=1}^t \hat{\epsilon}_s\right)^2 / \sigma^2_\epsilon$$
```