---
layout: default
title: Exercise 2
description: Import and pre-process your data
---

## Load the data

Download [rawcashflows.csv](assets/rawcashflows.csv) and save the file in the `data` directory.

Enter the following code in the console to open the project

```R
> load.project()
```

ProjectTemplate will print out a number of messages as the project opens.  As part of this process, all data in the `data` directory is automatically loaded into memory.  You can check the data has been loaded by running

```R
> head(rawcashflows)

# A tibble: 6 x 7
      X line1  line2  line3  line4  line5 line6
  <int> <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl>
1     1 5419. 15614. 16292. 12964. 19732. 4725.
2     2 5579. 15929. 16591. 13897. 20291. 3520.
3     3 5450. 15523. 16307. 14247. 20555. 3349.
4     4 4916. 15189. 16794. 14597. 20652. 3221.
5     5 3708. 14143. 15792. 13759. 20371. 2728.
6     6 3516. 13726. 15792. 13702. 20802. 2606.
```

## Data processing

Data pre-processing scripts are saved in the `munge` folder.  By default, ProjectTemplate will run these scripts when a project is loaded.

The data represents monthly cashflows for six business lines, covering a six year period starting from January 2019.  For the purposes of this analysis, we will aggregate the cashflows for each business line and store them as a time series object.

Replace the contents of `01-A.R` in the `munge` folder with the following code and run it by clicking `Source` at the top right of the script window.

```R
# Extract cashflows for analysis
cashflows_to_use = rawcashflows[-1]

# Sum the rows of the cashflows_to_use table and store them in cashflows
cashflows = apply(cashflows_to_use, 1, sum)

# Convert cashflows to a time series object (monthly frequency starting 01/2019)
cashflows = ts(cashflows, start=c(2019,1), frequency=12)
```

Review the processed cashflows by running

```R
> cashflows

           Jan       Feb       Mar       Apr       May       Jun       Jul       Aug       Sep       Oct       Nov       Dec
2019  74745.73  75806.47  75431.92  75369.54  70499.94  70145.14  68768.38  69180.25  67806.93  67137.06  65975.45  67501.55
2020  69021.06  71125.27  71904.86  73737.79  75219.03  77089.06  78891.84  81858.21  84104.65  85313.66  86211.66  85504.44
2021  88967.93  90945.45  93367.84  96273.92  97944.35 100950.73 103267.23 104752.50 104971.76 106221.24 108087.61 110795.66
2022 112267.34 113324.90 115041.22 116655.58 118671.40 118646.21 117415.46 115567.68 115938.50 114935.11 114686.74 115052.86
2023 116854.92 118285.90 120318.21 120647.65 124066.59 127266.34 131204.09 134259.75 135086.55 137808.61 141751.25 143700.78
2024 146171.69 149603.43 150657.80 154338.23 157246.42 160183.02 162482.05 163495.04 164494.54 166231.03 166576.49 169832.96
```

For larger projects with substantial amounts of pre-processing, you may wish to divide your pre-processing across several scripts.

When you have multiple pre-processing scripts in your `munge` directory, ProjectTemplate will execute these in a predictable order, based on file name. For example the following files would be executed in this order:

```R
01-A.r
01-B.r
02-A.r
02-AA.r
02-B.r
```

{% include nav.html left-url="./exercise1" left-text="Exercise 1"
centre-url="./index.html#contents" centre-text="Contents"
right-url="./exercise3" right-text="Exercise 3" %}
