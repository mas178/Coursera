---
title       : Simple Sample of Slidify
subtitle    : Overview of "IRIS Plot" Shiny Application
author      : Masaaki Inaba
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
license: by-sa

--- .segue .quote .dark

## What is this?

<q>"IRIS Plot" is a test application using "shiny". And this slide is also a test slide using "slidify".</q>

<style>
.dark q {
  color: white;
}
</style>


--- .class #id 

## Application Overview

<iframe src = 'https://inaba.shinyapps.io/IrisPlot' height='600px'></iframe>

--- .class #id 

## Data used in the applicaiton


```r
summary(iris)
```

```
##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50  
##                 
##                 
## 
```

--- .class #id 

## Source Code

1. [server.R](https://github.com/mas178/Coursera/blob/master/DevDataProduct/ShinyTest/server.R)
2. [ui.R](https://github.com/mas178/Coursera/blob/master/DevDataProduct/ShinyTest/ui.R)
3. [index.Rmd](https://github.com/mas178/Coursera/blob/master/DevDataProduct/Slidify/index.Rmd)

