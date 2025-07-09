
## Appendix - Financial Time-Series Features
1. **Non-stationarity**: Many financial time-series are non-stationary, meaning their statistical properties change over time.
2. **Low signal-to-noise ratio**: Financial time-series often have a low signal-to-noise ratio, making it difficult to extract meaningful signals.
3. **Autocorrelation**: Financial time-series often exhibit autocorrelation, meaning that past values can influence future values. Both positive and negative autocorrelation can be observed, depending on the asset class and the time horizon.
4. **Volatility clustering**: Financial time-series often exhibit periods of high and low volatility, known as volatility clustering. In HFT we can see this in event clustering, where large message-flow leads to large message-flow, often associated with periods of high volatility.
5. **Leverage effects**: Financial time-series often exhibit leverage effects, meaning that negative returns lead to higher volatility than positive returns of the same magnitude. This depends on the asset class, with large variations based on the flow of structured products, where hedges can change the underlying dynamics (i.e., the _tail wagging the dog_!).
6. **Skewness and kurtosis**: Financial time-series often exhibit skewness and kurtosis, meaning that they have asymmetric distributions with heavy tails.  Almost all financial time-series (and resulting strategies) are negatively skewed, meaning that they have a higher probability of large negative returns than large positive returns. This is particularly important in risk management, where the tails of the distribution can have a significant impact on risk measures such as Value at Risk (VaR). 
Surprisingly, _rend-following_ strategies, and _mean-reversion strategies_ can often be constructed to be positively skewed.
7. **Non-normality**: Financial time-series often exhibit non-normality, meaning that they do not follow a normal distribution. This is just a follow-on from the previous point. 

### References:
For a more detailed discussion of common features of financial time-series,
see
* [Rama Cont, Empirical Properties of Asset Returns: Stylized Facts and Statistical Issues](
https://www.tandfonline.com/doi/abs/10.1080/713665670). 
* Note that Cont studied high-frequency data, and 
analysis of autocorrelation is entirely different for lower-frequency and longer-horizon data. 
* The more recent paper [Revisting Cont's Stylized Facts for Modern Stock Markets](https://arxiv.org/abs/2311.07738).  Again, both of these focus on higher frequency data. In mid-frequency data, significant autocorrelation is observed (leading to mean-reversion!), and at lower frequency, leading to trends and momentum. Meanwhile, the leverage effect is altogether obvious at lower frequencies, with structured product flows changing it in certain markets. 
shows there is continued interest in the topic and newer analyses available over time.
