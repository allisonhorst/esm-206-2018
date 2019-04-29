# ESM 206 Labs - Intro Stats and Data Analysis for Environmental Science (Fall 2018)
## Lab Materials

Bren School of Environmental Science and Management, UC Santa Barbara 

Course goals: 

  - Intro to data analysis in R/RStudio
  - Data wrangling with the tidyverse
  - Exploratory data analysis
  - Basic summary statistics & hypothesis testing
  - Data visualization 
  - Reproducible workflows with RProjects, Rmarkdown, and GitHub

*Note: Repo and course materials are in development; forgive the dust and incompleteness while I work on it.*

Link to Weekly Materials | Lectures | Lab topics | Packages required | Some key functions introduced this week...
-----|--------| ---------|--------------|----------
[Week 0 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_0) | <ul><li>Install R and RStudio</li></ul> | none | none
[Week 1 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_1) | [Lecture 1](https://docs.google.com/presentation/d/1cPWa6NqbEot8dBjVC7UKPjF72Q7myYjHqyBYS9HO_qg/edit?usp=sharing) | <ul><li>Meet R and RStudio</li><li>Install and load the tidyverse</li><li>Read in a CSV</li><li>Wrangling basics with dplyr</li><li>Basic data exploration</li><li>The pipe operator</li><li>Intro to ggplot2 visualization</li></ul> | <ul><li>tidyverse</li></ul> | read_csv, names, dim, class, summary, head, tail, select, filter, arrange, mutate, pipe %>%, ggplot, geom_point, geom_line
[Week 2 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_2) | <ul><li>Working in R Projects</li><li>Intro to Rmarkdown</li><li>Data wrangling basics with dplyr</li><li>group_by() + summarize()</li><li>Basic ggplot histograms, column graphs, scatterplots, boxplots and jitterplots</li><li>Knitting to html</li></ul> | <ul><li>tidyverse</li><li>RColorBrewer</li></ul> | rename, group_by, summarize, write_csv, geom_col, factor, geom_histogram
[Week 3 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_3) | <ul><li>Data wrangling continued</li><li>Z-distribution probabilities </li><li>T-distribution and confidence intervals</li><li>Faceted graphs</li><li>Data exploration and graphing continued</li><li>Exploratory histograms and QQ-plots</li></ul>  | <ul><li>tidyverse</li></ul> | hist, qqnorm, qnorm, pnorm, dnorm, t.test, geom_qq, mean, sd
[Week 4 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_4) | <ul><li>In-line referencing in Rmarkdown, </li><li>Baby LaTeX example</li><li>dplyr::case_when, count, pull</li><li>Data exploration and graphing continued</li><li>Two-Sample T-tests (unpaired, one-sided and two-sided)</li><li> F-test for equal variances</li><li>Effect size (Cohen’s d)</li></ul> | <ul><li>tidyverse</li><li>effsize</li><li>pwr</li></ul> | case_when, geom_point, count, pull, var.test, t.test, cohen.d, pwr.t.test
[Week 5 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_5) | <ul><li>Power analysis</li><li>Data wrangling</li><li>Pipe directly to ggplot</li><li>Customizing in ggplot2</li><li>Interactive plots with plotly</li><li>Joining datasets with dplyr</li><li>Tables with kable + kableExtra</li></ul> | <ul><li>tidyverse</li><li>knitr</li><li>kableExtra</li><li>plotly</li><li>ggrepel</li><li>extrafont</li></ul> | ggplotly, full_join, kable
[Week 6 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_6) | <ul><li>Intro to GitHub</li><li>Working between RStudio and GitHub: Fork, clone, and start a version-controlled RProj</li><li>More ggplot2 practice and customization</li><li>dplyr::case_when</li><li>One-way ANOVA</li><li>Levene's Test</li><li>Post-hoc Tukey's HSD</li></ul> | <ul><li>tidyverse</li><li>car</li><li>onewaytests</li></ul> | with, table, leveneTest, aov, TukeyHSD, aov.test, paircomp
[Week 7 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_7)|<ul><li>Collaborating in GitHub exercise</li><li>More data wrangling, tidyr::spread and gather</li><li>Chi-square test for independence</li><li>Rank-based hypothesis tests</li></ul> | <ul><li>tidyverse</li><li>magrittr</li></ul> | spread, gather, set_rownames, chisq.test, round, wilcox.test
[Week 8 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_8)|<ul><li>**This was your TAKE HOME lab**</li><li>Exploratory data analysis</li><li>Simple linear regression</li><li>Model diagnostics</li><li>Model fit and statistics</li><li>Use model to make predictions</li><li>Correlation by Pearson's *r*</li></ul> | <ul><li>tidyverse</li></ul> | lm, data.frame, predict, cor.test
[Week 9 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_9)|<ul><li>Explore multivariate data</li><li>Correlation matrices</li><li>Multiple linear regression</li><li>Assess model diagnostics</li><li>Compare models, AIC</li><li>Table of regression results (stargazer)</li><li>Use model to make predictions</li></ul> | <ul><li>tidyverse</li><li>corrplot</li><li>stargazer</li></ul> | geom_density, AIC, stargazer
[Week 10 Materials](https://github.com/allisonhorst/esm-206-2018/tree/master/week_10)|<ul><li>Other fun tips</li><li>Heatmaps with geom_tile</li><li>Animated graphics with gganimate</li></ul> | <ul><li>tidyverse</li><li>janitor</li><li>lubridate</li><li>gganimate</li><li>RColorBrewer</li><li>scales</li><li>ggimage</li></ul> | geom_text, geom_image, clean_names, geom_tile, transition_reveal
