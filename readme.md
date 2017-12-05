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
##             PC1        PC2 taxon  group
## AAAAA  1.416156 -3.4994342 AAAAA group1
## BBBBB  2.364885 -3.1435084 BBBBB group2
## CCCCC  3.923850 -3.7085053 CCCCC group1
## DDDDD  4.779961 -3.1848266 DDDDD group2
## EEEEE  1.433133  2.9528747 EEEEE group1
## FFFFF -0.273229 -0.6153418 FFFFF group2
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

