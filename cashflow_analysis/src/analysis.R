# Load project
library("ProjectTemplate")
load.project()

# Model cashflows as an ARIMA(2,1,0) time series
cashflow_model = arima(cashflows, order=c(2,1,0))

# Create a 12 month forecast
forecast = forecast(cashflow_model, 12, level=c(80, 90, 95, 99))

# Plot the forecast
cf_plot = autoplot(forecast) +
  xlab("Year") +
  ylab("Cashflow") +
  ggtitle("12 month cashflow projection")

# Hold cashflow forecasts in a data frame
forecasts = data.frame(lower=c(cashflows, forecast$lower[,3]),
                       central=c(cashflows, forecast$mean),
                       upper=c(cashflows, forecast$upper[,3]))

# Set discount rate
disc = 0.03

# Discount cashflows
pv_lower = discount(forecasts[["lower"]], disc, 12)
pv_central = discount(forecasts[["central"]], disc, 12)
pv_upper = discount(forecasts[["upper"]], disc, 12)
