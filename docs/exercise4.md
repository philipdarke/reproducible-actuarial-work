---
layout: default
title: Exercise 4
description: Forecast the cashflows and calculate the present value
---

We can now forecast the cashflows to December 2025 and calculate the present value.

Analysis scripts are saved in the `src` folder.  These are not automatically run when a project is opened, so it is helpful to load the project at the top of each script so it can be run as a standalone piece of analysis.

Create a new R script called `analysis.R` in the `src` folder with the following code and run it by clicking `Source`.

```R
# Load project
library("ProjectTemplate")
load.project()

# Model cashflows as a ARIMA(2,1,0) time series
cashflow_model = arima(cashflows, order=c(2,1,0))

# Create an 12 month forecast
forecast = forecast(cashflow_model, 12, level=c(80, 90, 95, 99))

# Plot the forecast
cf_plot = autoplot(forecast)

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
```

This code models the cashflows as a time series using the `arima()` function and forecasts them over the following 12 months.  A plot of the forecast is created using `ggplot2` and stored as a variable.  The cashflows are held in a data frame and the `discount()` helper function is used to discount them.

The results can be viewed by running the following code in the console.

```R
> pv_lower
[1] 8695840
> pv_central
[1] 8851433
> pv_upper
[1] 9007027
```

Running `> cf_plot` will display a graph of the cashflows in the plots plane.

## ggplot2

`ggplot2` is a system for creating graphics in R.  The cheat sheet [here](https://github.com/rstudio/cheatsheets/blob/master/data-visualization-2.1.pdf) and the [data visualisation](https://r4ds.had.co.nz/data-visualisation.html) chapter of R for Data Science covers how to use `ggplot2` in detail.

You may wish to use these resources to improve the plot by adding axis labels and a better title.

<div class="nav">
  <div class="back"><a href="./exercise3"><< Exercise 3</a></div>
  <div class="contents"><a href="./index.html#contents">Contents</a></div>
  <div class="forward"><a href="./exercise5">Exercise 5 >></a></div>
</div>
