---
layout: default
title: Exercise 5
description: Create a report using R Markdown
---

R Markdown is a powerful notebook interface that allows code to be placed in a document alongside text.  RStudio have created a short guide [here](https://rmarkdown.rstudio.com/lesson-1.html) with more information.

The benefits of R Markdown are:

* You can include the results of your analysis directly in your reports without cutting and pasting.  This reduces the potential for errors.
* There is a direct link between your analysis and the report.  When you update the analysis, so will the report.
* Document formatting is automatic when you write your report using the markdown syntax.  The cheat sheet [here](https://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf) summarises the markdown syntax.

## Set up R Markdown

The set up R Markdown run the following code in the console

```R
install.packages("rmarkdown")
```

If you want to create PDF documents you will need to also install LaTex.  Popular options are [MiKTex](https://miktex.org/) for Windows, [MacTeX](http://www.tug.org/mactex/) for Mac OS X and [TeX Live](https://www.tug.org/texlive/) for Linux.  Alternatively, [TinyTex](https://yihui.name/tinytex/) is a cut down solution that you can install directly from R using

```R
install.packages("tinytex")
tinytex::install_tinytex()
```

## Using R Markdown

Reports are saved in the `reports` directory.  To create a R Markdown report go to `File / New File / R Markdown...`, enter the report title, author name and choose PDF.

To insert a chunk of R code choose `Insert / R` at the top right of the script pane.  The cog-wheel button on the right of the chunk lets you choose whether the code and output is included in the report.

The header contains the basic set up for the document.

```
---
title: "Document title""
author: "Name"
date: "Date"
output: pdf_document
---
```

Various output types are supported, including Microsoft Word, HTML websites and presentations.

The first chunk should include the following to set up the document

```R
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_knit$set(root.dir= normalizePath('..'))
```

You can import the results of analysis by adding a chunk linking to the script you wish to import, for example `source("src/analysis.R")`, and then refer to the variables and plots in the document.

When you are ready to create the report, choose `Knit` at the top of the script pane and a PDF will be created.

We recommend [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) by Yihui Xie, J. J. Allaire and Garrett Grolemund if you want to learn more.

## Creating the report

Download [report.Rmd](assets/report.Rmd) and save it in the `reports` directory.  Click `Knit` to create a PDF which should look like [this](assets/report.pdf).

Review report.Rmd to see how results from the analysis have been included.  You can experiment by making changes or trying different document types (try `html_document` for example).

You can also create templates to customise how the document looks, for example to match your organisation's report style.
