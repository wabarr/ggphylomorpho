#' Make a phylomorphospace plot
#'
#' @param tree object of class \code{phylo}
#' @param tipinfo a dataframe containing two continuous variables (typically PC1 and PC2 from a PCA) as well as a grouping variable and a variable of labels for each point on the plot
#' @param xvar the unquoted name of the column containing the x variable in the tipinfo dataframe. Defaults to \code{PC1}
#' @param yvar the unquoted name of the column containing the y variable in the tipinfo dataframe. Defaults to \code{PC2}
#' @param factorvar the unquoted name of the column containing the grouping variable in the tipinfo dataframe. Defaults to \code{group}
#' @param labelvar the unquoted name of the column containing the labeling variable in the tipinfo dataframe. Defaults to \code{taxon}
#' @param title the text string to use as the title of the phylomorphospace plot
#' @param xlab the text label for the x axis
#' @param ylab the text label for the y axis
#' @return the ggplot object representing the phylomorphospace


ggphylomorpho <- function(tree,
                          tipinfo,
                          xvar=PC1,
                          yvar=PC2,
                          factorvar=group,
                          labelvar=taxon,
                          title="Phylomorphospace",
                          xlab="PC1",
                          ylab="PC2")
  {

  require(ggplot2)
  require(phytools)

  ## create matrix for use in phytools::fastAnc()
  mat <- cbind(eval(substitute(xvar), tipinfo),eval(substitute(yvar), tipinfo))
  rownames(mat) <- eval(substitute(labelvar), tipinfo)
  stopifnot(length(setdiff(tree$tip.label, rownames(mat))) == 0)

  xAnc <- fastAnc(tree, mat[,1])
  yAnc <- fastAnc(tree, mat[,2])

  all_node_coords <-
    data.frame(
      #put PC values for all nodes and tips in a dataframe
      #tips go first in order of tip labels, then numerical order for nodes
      x=c(mat[tree$tip.label,1], xAnc),
      y=c(mat[tree$tip.label,2], yAnc),
      nodeid=1:(tree$Nnode + length(tree$tip.label))
      )

  #get edge list from tree object
  edges <- data.frame(tree$edge)
  names(edges) <- c("node1", "node2")
  #translate tip/node numbers into PC coordinates in all_node_coords dataframe
  edgecoords <- merge(
    merge(edges, all_node_coords, by.x="node1", by.y="nodeid"),
    all_node_coords, by.x="node2", by.y="nodeid")

  pointsForPlot <-
    data.frame(x=eval(substitute(xvar), tipinfo),
               y=eval(substitute(yvar), tipinfo),
               color=eval(substitute(factorvar), tipinfo),
               label=eval(substitute(labelvar), tipinfo))

  theplot <-
    ggplot() +
    geom_segment(data=edgecoords,aes(x=x.x,xend=x.y, y=y.x, yend=y.y)) +
    geom_point(data=pointsForPlot, aes(x=x, y=y, color=color), size=5) +
    geom_text(data=pointsForPlot, aes(x=x, y=y, label=label)) +
    labs(title=title, x=xlab, y=ylab) +
    theme_bw(20) +
    theme(legend.position='bottom')
  return(theplot)
}
