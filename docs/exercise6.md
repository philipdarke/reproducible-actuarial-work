---
layout: default
title: Exercise 6
description: Test your results using testthat
---

`testthat` can be used to add automated tests and checks to your work.  The book [R Packages](http://r-pkgs.had.co.nz/tests.html) has a chapter explaining the testing process and how to use `testthat`.

We will set up some simple tests to test the pre-processing in Exercise 2 and the `discount()` helper function created in Exercise 3.

## Setting up a test

Test code is saved in the `tests` directory.  Delete `1.R` and add `test.R` with the following code

```R
# Test data
test_that("Correct business lines are included", {
  expect_equal(ncol(cashflows_to_use), 6)
})

# Test discount() helper function
test_that("discount() works correctly", {
  expect_equal(discount(c(1000, 1000, 1000), 0.05, 1), 1000*(1.05^-0.5 + 1.05^-1.5 + 1.05^-2.5))
  expect_equal(discount(c(1000, 1000, 1000), 0.03, 12), 1000*(1.03^-(1/24) + 1.03^-(1/12 + 1/24) + 1.03^-(2/12 + 1/24)))
  expect_equal(discount(rep(1000, 10), 0, 1), 10000)
})
```

The format for the tests above is `expect_equal(A, B)` i.e. the code A is expected to be equal to B when run.

The first block of code checks that cashflows from all six business lines are included in the analysis (it checks the number of columns in the `cashflows_to_use` matrix equals 6).

The second tests that the output from the `discount()` helper function is expected for some simple test inputs.

## Running the tests

Run the following to carry out the tests

```R
> test.project()

Project name: cashflow_analysis
Loading project configuration
Autoloading packages
 Loading package: reshape2
 Loading package: plyr
 Loading package: tidyverse
 Loading package: stringr
 Loading package: lubridate
 Loading package: forecast
 Loading package: ggplot2
Autoloading helper functions
 Running helper script: globals.R
 Running helper script: helpers.R
Autoloading data
Munging data
 Running preprocessing script: 01-A.R
√ | OK F W S | Context
/ |  4       | 0
== Results =====================================================================
OK:       4
Failed:   0
Warnings: 0
Skipped:  0
```

If any tests fail, the following code will print more information.  

This code runs all the tests in the `tests` directory and prints detailed output.  See the next exercise for an example.

```R
> (test_dir("tests", reporter = "list"))
```
