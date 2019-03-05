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

To set up R Markdown run the following code in the console

```R
> install.packages("rmarkdown")
```

If you want to create PDF documents you will need to also install LaTeX.

Popular options are [MiKTex](https://miktex.org/) for Windows, [MacTeX](http://www.tug.org/mactex/) for Mac OS X and [TeX Live](https://www.tug.org/texlive/) for Linux.  Alternatively, [TinyTeX](https://yihui.name/tinytex/) is a cut down solution that you can install directly from R using

```R
> install.packages("tinytex")
> tinytex::install_tinytex()
```

TinyTeX is likely to be the simplest option if you only want to install LaTeX to experiment with these exercises.

## Using R Markdown

To create a R Markdown report go to `File / New File / R Markdown...`, enter the report title, author name and choose PDF.

Reports are saved in the `reports` directory.

### Front matter

The front matter at the top of a R Markdown file contains the basic set up for the document.

```
---
title: "Document title"
author: "Name"
date: "Date"
output: pdf_document
---
```

Various [output types](https://rmarkdown.rstudio.com/gallery.html) are supported, including Microsoft Word, HTML websites and presentations.

### Code chunks

To insert a chunk of R code into a document choose `Insert / R` at the top right of the script pane.  The cog-wheel button on the right of the chunk lets you choose whether the code and/or output is included in the report.

The first chunk should include the following to set up the document

```R
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_knit$set(root.dir= normalizePath('..'))
```

You can import the results of analysis to a R Markdown document by adding a chunk to run the script you wish to import (for this example you would use `source("src/analysis.R")`).  You then refer directly to the variables and plots in the analysis script when writing the document.  **This is the key to linking your analysis directly to the report.**

### Refering to variables in your document text

To insert a variable into your text, use `r variable_name`.  You must surround the code with tick marks (&#96;).

To format a variable use the [format function](https://www.rdocumentation.org/packages/base/versions/3.5.2/topics/format), for example `r format(round(variable_name,-3), big.mark=",")` rounds a variable to the nearest thousand and inserts a breaking comma e.g. 123,000.

The example report below shows how this works.

### Creating the document

To create a document, select `Knit` at the top of the script pane.  This runs you code, inserts the results into the document and saves the output.

### Further resources

We recommend [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/) by Yihui Xie, J. J. Allaire and Garrett Grolemund if you want to learn more.

## Creating the report

Download [report.Rmd](assets/report.Rmd) and save it in the `reports` directory.

Enter the document title, your name, your organisation and the date under `params` in the front matter and click `Knit` to create a PDF which should look like [this](assets/report.pdf).

Review `report.Rmd` to see how results from the analysis have been included in the document.  You can experiment by making changes or trying different document types (try replacing `pdf_document` with `html_document` in the front matter).

You can also create templates to customise how the document looks, for example to match your organisation's report style.  See [advanced customisation](https://bookdown.org/yihui/rmarkdown/pdf-document.html#advanced-customization-1) for some pointers.

{% include nav.html left-url="./exercise4" left-text="Exercise 4"
centre-url="./index.html#contents" centre-text="Contents"
right-url="./exercise6" right-text="Exercise 6" %}
