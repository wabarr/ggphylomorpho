# readme
Andrew Barr  
9/18/2017  

## install and load package

Note: this assumes you already installed the `devtools` package.  If you haven't you should do so using the normal R package management tools. 


```r
#devtools::install_github("wabarr/ggphylomorpho")
library(ggphylomorpho)
```

## make example data


```r
sampleData <- makesampledata()

plot(sampleData$tree)
```

![](readme_files/figure-html/unnamed-chunk-1-1.png)<!-- -->

```r
head(sampleData$DF)
```

```
##         PC1         PC2 taxon  group
## A -2.060427 -0.05738028     A group1
## B -6.042691  1.95309070     B group2
## C -5.498482  1.97479700     C group1
## D -6.020761  2.25013877     D group2
## E -3.637639 -0.01376266     E group1
## F -1.705474  2.83344660     F group2
```

## check out the documentation for the function

```r
?ggphylomorpho
```

## make a phylomorphospace


```r
ggphylomorpho(tree=sampleData$tree, tipinfo=sampleData$DF)
```

![](readme_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

