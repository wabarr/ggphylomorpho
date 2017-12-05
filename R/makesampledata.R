makesampledata <- function(){
  require(phytools)
  labs <- sapply(LETTERS, FUN=function(x) paste(rep(x, 5), collapse=""))
  tree<-pbtree(n=26,tip.label=labs)
  DF <- data.frame(
    PC1=fastBM(tree),
    PC2=fastBM(tree),
    taxon=labs,
    group=rep(c("group1","group2"),13)
  )
  return(list(tree=tree, DF=DF))
}
