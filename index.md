---
title       : My Test Deck
subtitle    : An exploration
author      : James Jurach
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Something Interesting


```r
x <- runif(100, min=0, max=100)
y <- 1.2*x + 10 + rnorm(length(x), sd=2)
plot(y ~ x)
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 
1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

--- .class #id 

## Something Interesting


```r
x <- runif(100, min=0, max=100)
y <- -1.2*x + 10 + rnorm(length(x), sd=10)
plot(y ~ x)
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 
1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

--- .class #id 

## Slide 3
 
La la la
