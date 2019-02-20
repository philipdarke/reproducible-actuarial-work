---
layout: default
title: Reproducible data science techniques in actuarial work
---

<style type="text/css" media="screen">
  iframe {
    max-width: 100%;
  }
  .presentation {
    position: relative;
    width: 100%;
    height: 0;
    padding-bottom: 59%;
  }
  .presentation iframe {
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0; top: 0;
  }
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 70%;
  }
  .bluetext {
    color: #00a8f3;
    font-weight: bold;
  }
  .greentext {
    color: #0ed145;
    font-weight: bold;
  }
  .orangetext {
    color: #ff7f27;
    font-weight: bold;
  }
</style>

**How can actuaries ensure that workflows are efficient, minimise the risk of errors and allow complex work to be reproduced by others in their organisation?**

Actuaries exploring the use of data science have the opportunity to revisit existing ways of working and consider whether they remain appropriate.  These challenges are also being faced in science and by other professions.

This presentation looks at why the concept of *reproducible work* is key and how it can help address the challenges of working in data intensive fields.

<div class="presentation">
  <iframe class="speakerdeck-iframe" frameborder="0" src="//speakerdeck.com/player/407eb48039984407ae1a1d7e4960504a?" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" style="border: 0px; background: padding-box rgba(0, 0, 0, 0.1); margin: 0px; padding: 0px; border-radius: 6px; box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 40px;"></iframe>
</div>

The presentation can be downloaded [here](assets/reproducible_actuarial_work.pdf).

This work was originally presented at the Data Science: Opportunities for Actuaries virtual event in February 2019.

# Exercises

In the following exercises you will set up a simple reproducible workflow using some of the tools introduced.

## Initial setup

The exercises use the R statistical programming language and RStudio (a popular development environment for R).  

R and RStudio are free open source tools available for Windows, Mac OS X and Linux.  R can be downloaded [here](https://cran.r-project.org/) and the open source edition of RStudio Desktop can be downloaded [here](https://www.rstudio.com/download).

No programming experience is assumed, but if you are new to R or RStudio you can find online learning resources [here](https://www.rstudio.com/online-learning/).  In particular we recommend [R for Data Science](https://r4ds.had.co.nz/) by Hadley Wickham and Garret Grolemund.

## RStudio basics

<a href="assets/images/RStudio.png">![RStudio](assets/images/RStudio.png)</a>

<p>Execute code by running a <span class="bluetext">script</span> or by entering it in the <span class="greentext">console</span>.</p>

To create a script select **File / New File / R Script**.  To run the code in a script click **Source** at the top right of the script window.  Alternatively you can highlight a subsection of your code and click **Run**.

<p>Output is displayed either in the console or in the <span class="orangetext">plots pane</span>.</p>
