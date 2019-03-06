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
# Give tests in this file a name
context("Basic checks")

# Test data
test_that("Correct business lines are included", {
  expect_equal(ncol(cashflows_to_use), 6)
})

# Test discount() helper function
test_that("discount() works correctly", {
  # Discount 3 payments of 1,000 at 5% p.a.
  expect_equal(discount(c(1000, 1000, 1000), 0.05, 1),
               1000*(1.05^-0.5 + 1.05^-1.5 + 1.05^-2.5))
  # Discount 3 payments of 1,000 (paid monthly) at 3% p.a.
  expect_equal(discount(c(1000, 1000, 1000), 0.03, 12),
               1000*(1.03^-(1/24) + 1.03^-(1/12 + 1/24) + 1.03^-(2/12 + 1/24)))
  # Discount 10 payments of 1,000 at 0%
  expect_equal(discount(rep(1000, 10), 0, 1),
               10000)
})
```

The format for the tests above is `expect_equal(A, B)` i.e. the code A is expected to be equal to the value B when the test is run.

The first block of code checks that cashflows from all six business lines are included in the analysis (it checks the number of columns in the `cashflows_to_use` tibble/data frame equals 6).

The second tests that the output from the `discount()` helper function is as expected for some simple test inputs.

## Running the tests

Run `test.project()` to carry out the tests and display a summary of the results in a table.  `testhat` provides additional information if a test (or tests) fail.

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
√ | OK F W S | Context
√ |  4       | Basic checks

== Results =====================================================================
OK:       4
Failed:   0
Warnings: 0
Skipped:  0

Keep up the good work.
```

A message will be displayed if a test (or tests) fail.

You can display a full summary of the tests by running

```R
> (test_dir("tests", reporter = "list"))

    file      context                                test nb failed skipped error warning user system real
1 test.R Basic checks Correct business lines are included  1      0   FALSE FALSE       0 0.02      0 0.02
2 test.R Basic checks          discount() works correctly  3      0   FALSE FALSE       0 0.00      0 0.00
```

## Continuous integration

The process of running tests can be automated using continuous integration tools such as [Travis CI](https://travis-ci.org/).  These services build your project and run all tests when you "commit" your changes using a version control tool such as GitHub.

You can also use code coverage tools such as [Codecov](https://codecov.io/) to monitor how much of your code is subject to automatic testing.  These tools can highlight when parts of your code are not being checked, prompting you to write more unit tests.

{% include nav.html left-url="./exercise5" left-text="Exercise 5"
centre-url="./index.html#contents" centre-text="Contents"
right-url="./exercise7" right-text="Exercise 7" %}
