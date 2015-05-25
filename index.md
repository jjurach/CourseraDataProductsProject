---
title       : Austin Restaurant Inspections
subtitle    : An exploration
author      : James Jurach
job         : 
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn       # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
url         : {lib: "."}
revealjs:
  theme: solarized
  transition: none
  center: "true"
bootstrap:
  theme: amelia
---

# Austin Restaurant Inspections

## A New Shiny App

A submitted project for Coursera Developing Data Products

--- .class #id 


## Restaurant Inspections

https://jamesjurach.shinyapps.io/AustinRestaurantInspections
is a most amazing application. It has these features:

* A map of Austin

* A dot for each restaurant colored by score

* Interactive criteria selection and zoom.

--- .class #id 



```r
df0 <- read.csv('austin_restaurant_inspections.csv')
df <- df0[df0$score<80 & df0$lon> -97.748891 &
           df0$lon< -97.738420 & df0$lat > 30.263400 & df0$lat < 30.274056,]
map <- readRDS("map-16.rds")
ggmap(map) + geom_point(aes(lon, lat, tooltip=name), data=df, alpha=0.8,
             color=df$score, point_size=5) + labs(x=NULL, y=NULL)
```

![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 

--- .class #id 

## Starbucks Scores


```r
ggplot(df0, aes(x=score)) +
  geom_histogram(aes(y=..density..), binwidth=0.5) +
  geom_density(alpha=.2, fill="#FF6666")
```

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png) 

--- .class #id

# Thank You

I hope you enjoy my Shiny Application and your remaining evaluations.

