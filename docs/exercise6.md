---
layout: default
title: Exercise 6
description: Test your results using testthat
---

`testthat` can be used to add automated tests and checks to your work (in software development these are known as "unit tests").  The book [R Packages](http://r-pkgs.had.co.nz/tests.html) has a chapter explaining the testing process and how to use `testthat`.

You can think of tests as a set of rules that your code must follow.  Testing tools such as `testthat` run your code and notify you if the results break these rules.

We will set up some simple tests to check the pre-processing carried out in Exercise 2 and the `discount()` helper function created in Exercise 3.

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

The format for the tests above is `expect_equal(A, B)` i.e. the code A is expected to be equal to the value B when the test is run.

The first block of code checks that cashflows from all six business lines are included in the analysis (it checks the number of columns in the `cashflows_to_use` tibble/data frame equals 6).

The second tests that the output from the `discount()` helper function is as expected for some simple test inputs.

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
Autoloading helper functions
 Running helper script: globals.R
 Running helper script: helpers.R
Autoloading data
Munging data
 Running preprocessing script: 01-A.R
Loading required package: testthat
√ | OK F W S | Context
/ |  4       | 0
== Results =====================================================================
OK:       4
Failed:   0
Warnings: 0
Skipped:  0

Keep up the good work.
```

If any tests fail, the following code will print more information.  

```R
> (test_dir("tests", reporter = "list"))
```

This code runs all the tests in the `tests` directory and prints detailed output.  See [Exercise 7](./exercise7) for an example.

## Continuous integration

The process of running tests can be automated using continuous integration tools such as [Travis CI](https://travis-ci.org/).  These services build your project and run all tests when you "commit" your changes using a version control tool such as GitHub.

You can also use code coverage tools such as [Codecov](https://codecov.io/) to monitor how much of your code is subject to automatic testing.  These tools can highlight when parts of your code are not being checked, prompting you to write more unit tests.



<div class="nav">
  <div class="back"><a href="./exercise5"><< Exercise 5</a></div>
  <div class="contents"><a href="./index.html#contents">Contents</a></div>
  <div class="forward"><a href="./exercise7">Exercise 7 >></a></div>
</div>
