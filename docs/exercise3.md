---
layout: default
title: Exercise 3
description: Helper functions and R libraries
---

R uses a system of libraries to add additional statistical functionality.  ProjectTemplate can automatically load libraries when a project is opened.

In addition to using libraries, it is often helpful to write helper functions to streamline analysis.  This exercise demonstrates how to do this with ProjectTemplate.

## Loading libraries

We will use the `forecast` library in our analysis.

To add this library to the project, go to `global/config.dcf`, set `load_libraries` to TRUE (so that the libraries are loaded when a project is opened) and add it to the list of libraries.

Following this, `config.dcf` should look like this

```R
version: 0.8.2
data_loading: TRUE
data_loading_header: TRUE
data_ignore:
cache_loading: TRUE
recursive_loading: FALSE
munging: TRUE
logging: FALSE
logging_level: INFO
load_libraries: TRUE
libraries: reshape2, plyr, tidyverse, stringr, lubridate, forecast
as_factors: TRUE
data_tables: FALSE
attach_internal_libraries: FALSE
cache_loaded_data:  TRUE
sticky_variables: NONE
```

If you are working with a large dataset, it can be helpful to switch off `data_loading` and `munging` (data pre-processing) once these steps have been completed.  If caching is set to true, the data will be loaded from the cache when the project is opened which will be quicker.

## Helper functions

We will also add a helper function that calculates the present value of a vector of cashflows.

Helper functions are saved in `lib/helpers.R`.  These functions are loaded when a project is opened.

Replace the contents of `helpers.R` in the `lib` folder with the code below and load the function by clicking `Source`.

```R
# discount(cashflows, disc, freq)
# Helper function to calculate the present value of a vector of cashflows.
# cashflows = input vector of cashflows
# disc = discount rate
# freq = payment frequency p.a. of cashflows e.g. 1 is annual, 12 is monthly
discount = function(cashflows, disc, freq) {
  t = 1:length(cashflows) - 0.5
  D = (1 + disc)^-(t/freq)
  pv = as.numeric(cashflows %*% D)
}
```

{% include nav.html left-url="./exercise2" left-text="Exercise 2"
centre-url="./index.html#contents" centre-text="Contents"
right-url="./exercise4" right-text="Exercise 4" %}
