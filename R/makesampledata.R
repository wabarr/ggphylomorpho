makesampledata <- function(){
  require(phytools)
  tree<-pbtree(n=26,tip.label=LETTERS)
  DF <- data.frame(
    PC1=fastBM(tree),
    PC2=fastBM(tree),
    taxon=LETTERS,
    group=rep(c("group1","group2"),13)
  )
  return(list(tree=tree, DF=DF))
}
