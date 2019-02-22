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

# A tibble: 72 x 7
       X line1  line2  line3  line4  line5 line6
   <int> <dbl>  <dbl>  <dbl>  <dbl>  <dbl> <dbl>
 1     1 5419. 15614. 16292. 12964. 19732. 4725.
 2     2 5579. 15929. 16591. 13897. 20291. 3520.
 3     3 5450. 15523. 16307. 14247. 20555. 3349.
 4     4 4916. 15189. 16794. 14597. 20652. 3221.
 5     5 3708. 14143. 15792. 13759. 20371. 2728.
 6     6 3516. 13726. 15792. 13702. 20802. 2606.
 7     7 3531. 13649. 15453. 14007. 19801. 2326.
 8     8 4268. 13385. 15379. 13630. 19711. 2808.
 9     9 4778. 13385. 15386. 13117. 18826. 2315.
10    10 4418. 13317. 16191. 12541. 18602. 2068.
# ... with 62 more rows
```

## Data processing

Data pre-processing scripts are saved in the `munge` folder.  By default, ProjectTemplate will run these scripts when a project is loaded.  If you have multiple pre-processing scripts they are run in alphabetical order.

The data represents monthly cashflows for six business lines, covering a six year period starting from January 2019.  For the purposes of this analysis, we will aggregate the cashflows for each business line and store them as a time series object.

Replace the contents of `01-A.R` in the `munge` folder with the following code and run it by clicking `Source` at the top right of the script window.

```R
# Sum the rows of the rawcashflow table and store them in the variable cashflows
cashflows = apply(rawcashflows, 1, sum)

# Convert cashflows to a time series object (monthly frequency starting 01/2019)
cashflows = ts(cashflows, start=c(2019,1), frequency=12)
```

Review the processes cashflows by running

```R
> cashflows

           Jan       Feb       Mar       Apr       May       Jun       Jul       Aug       Sep       Oct       Nov       Dec
2019  74746.73  75808.47  75434.92  75373.54  70504.94  70151.14  68775.38  69188.25  67815.93  67147.06  65986.45  67513.55
2020  69034.06  71139.27  71919.86  73753.79  75236.03  77107.06  78910.84  81878.21  84125.65  85335.66  86234.66  85528.44
2021  88992.93  90971.45  93394.84  96301.92  97973.35 100980.73 103298.23 104784.50 105004.76 106255.24 108122.61 110831.66
2022 112304.34 113362.90 115080.22 116695.58 118712.40 118688.21 117458.46 115611.68 115983.50 114981.11 114733.74 115100.86
2023 116903.92 118335.90 120369.21 120699.65 124119.59 127320.34 131259.09 134315.75 135143.55 137866.61 141810.25 143760.78
2024 146232.69 149665.43 150720.80 154402.23 157311.42 160249.02 162549.05 163563.04 164563.54 166301.03 166647.49 169904.96
```
