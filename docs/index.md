---
layout: default
title: Reproducible data science techniques in actuarial work
---

**How can actuaries ensure that workflows are efficient, minimise the risk of errors and allow complex work to be reproduced by others in their organisation?**

Actuaries exploring the use of data science have the opportunity to revisit existing ways of working and consider whether they remain appropriate.  These challenges are also being faced in science and by other professions.

This presentation looks at why the concept of *reproducible work* is key and how it can help address the challenges of working in data intensive fields.

<div class="presentation">
  <iframe class="speakerdeck-iframe" frameborder="0" src="//speakerdeck.com/player/407eb48039984407ae1a1d7e4960504a?" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" style="border: 0px; background: padding-box rgba(0, 0, 0, 0.1); margin: 0px; padding: 0px; border-radius: 6px; box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 40px;"></iframe>
</div>

The presentation can be downloaded [here](assets/reproducible_actuarial_work.pdf).

This work was originally presented at the Data Science: Opportunities for Actuaries virtual event in February 2019.

# Exercises

In the following exercises you will set up a simple reproducible workflow using some of the tools introduced in the presentation.

As a toy example to demonstrate the approach, the analysis takes some cashflow data, projects it and calculates the present value.  Automatic checks are set up and a [report](assets/report.pdf) is produced.

## Initial setup

The exercises use the R statistical programming language and RStudio (a popular development environment for R).

R and RStudio are free open source tools available for Windows, Mac OS X and Linux.  R can be downloaded [here](https://cran.r-project.org/) and the open source edition of RStudio Desktop can be downloaded [here](https://www.rstudio.com/download).

## RStudio basics

<a href="assets/images/RStudio.png">![RStudio](assets/images/RStudio.png)</a>

<p>Execute code by running a <span class="bluetext">script</span> or by entering it in the <span class="greentext">console</span>.</p>

To create a script select `File / New File / R Script`.  To run the code in a script click `Source` at the top right of the script window.  Alternatively you can highlight a subsection of your code and click `Run`.

<p>Output is displayed in the <span class="greentext">console</span> or the <span class="orangetext">plots pane</span>.  Use the tabs at the top of the plots pane to access Files, Packages and Help.</p>

## Using Git for version control

A version control system is a key part of a reproducible workflow.

Version control is like having an unlimited "undo" button.  It avoids managing multiple versions of the same file and allows many people to work in parallel on a project.  Most software developers and data scientists use version control for their work.

If you want to use version control alongside these exercises, this [guide](http://homepages.cs.ncl.ac.uk/matthew.forshaw/teaching/csc8627/versioncontrol/) explains how to set up and use Git with [GitHub](https://github.com/).

## Getting help

If you are new to R or RStudio you can find online learning resources [here](https://www.rstudio.com/online-learning/).  In particular we recommend [R for Data Science](https://r4ds.had.co.nz/) by Hadley Wickham and Garret Grolemund.

<h2 id="contents">Exercises</h2>

<ul>
  <li><a href="exercise1">Exercise 1</a>: Use ProjectTemplate to structure an data analysis project in R</li>
  <li><a href="exercise2">Exercise 2</a>: Import and pre-process your data</li>
  <li><a href="exercise3">Exercise 3</a>: Helper functions and R libraries</li>
  <li><a href="exercise4">Exercise 4</a>: Forecast the cashflows and calculate the present value</li>
  <li><a href="exercise5">Exercise 5</a>: Create a report using R Markdown</li>
  <li><a href="exercise6">Exercise 6</a>: Test your results using testthat</li>
  <li><a href="exercise7">Exercise 7</a>: Updating the analysis and report</li>
  <li><a href="nextsteps">Next steps</a></li>
</ul>

{% include nav.html right-url="./exercise1" right-text="Exercise 1" %}
