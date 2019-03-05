---
layout: default
title: Exercise 7
description: Updating the analysis and report
---

The final exercise demonstrates the advantages of working reproducibly.

> You have discussed the report with your colleagues/manager/client.
>
> Disaster!  It has emerged that the cashflows for business lines 5 and 6 should not have been included in the analysis and the discount rate should have been 2.75% p.a.

If your workflow looked like this you would have to amend the analysis in Excel and manually update the Word document.

<a href="https://ukgovdatascience.github.io/rap_companion/why.html#the-current-statistics-production-process">![Workflow](assets/images/rap_messypipeline.png)</a>
*Image above from the [RAP Companion](https://ukgovdatascience.github.io/rap_companion/)*

Manual steps such as these are time consuming and can introduce errors.

Critically, a mismatch can emerge between the report and the underlying analysis.  For example, you might update the discount rate in the report but forget to do so in the spreadsheet.  Would this get caught when the work was checked?

**Working reproducibly minimises the risk of these errors and allows changes to be made efficiently.**

## Update the analysis

In order to make the required changes:

* Replace line 2 of the `munge/01-A.R` script with `cashflows_to_use = rawcashflows[2:5]` to remove the cashflows for lines 5 and 6.  Note that we never edit the raw data!

* Change line 20 in the `src/analysis.R` script to `disc = 0.0275` to change the discount rate.

## Check your changes

Before creating the report, run your tests in the console to check that they still pass.

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
x |  3 1     | Basic checks
--------------------------------------------------------------------------------
test.R:6: failure: Correct business lines are included
ncol(cashflows_to_use) not equal to 6.
1/1 mismatches
[1] 4 - 6 == -2
--------------------------------------------------------------------------------

== Results =====================================================================
OK:       3
Failed:   1
Warnings: 0
Skipped:  0
```

You can see that three tests have passed but one has failed.

Reviewing the output from `testthat` reveals that:

* The "Correct business lines are included" test on line 6 of `test.R` has failed.
* This test checks that `ncol(cashflows_to_use)` equals 6.
* The actual value of the test was 4 which is 2 less than the expected value.

Recall that this test checks that there are six sets of cashflows in the analysis.  Now that two business lines have been removed, the test should instead check that there are four sets of cashflows.

To correct this, go to `test.R` and change line 6 to `expect_equal(ncol(cashflows_to_use), 4)`.  All tests should now pass and you can finalise the report.

## Finalise the report

Open `reports/report.Rmd` (in practice you would likely also need to update the wording) and click `Knit`.  A new [report](assets/report2.pdf) will be created with the updated results.

**Note how the figures, plot and tables have all updated to reflect the new analysis.**

<div class="nav">
  <div class="back"><a href="./exercise6"><< Exercise 6</a></div>
  <div class="contents"><a href="./index.html#contents">Contents</a></div>
  <div class="forward"><a href="./nextsteps">Next steps >></a></div>
</div>
