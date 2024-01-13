
mcmcSummary <- function (mat, rows = 4, lag.max=100, bins=30, show = TRUE, plot = TRUE, truth=NULL) 
{
  d = dim(mat)
  p = d[2]
  summ=summary(mat)
  if (show==TRUE) {
    message(paste("N =", d[1], "iterations"))
    print(summ)
    message("Standard deviations:")
    print(apply(mat, 2, sd))
  }
  if (plot==TRUE) {
    names = colnames(mat)
    op = par(mfrow = c(rows, 3))
    for (i in 1:p) {
      plot(ts(mat[, i]), main = names[i], ylab = "Value", xlab = "Iteration")
      if (!is.null(truth)) abline(truth[i],0,lwd=2,col=2)
      acf(mat[, i], lag.max = lag.max, main = names[i], ci=0, ylim=c(-0.5,1))
      hist(mat[, i], bins, main = names[i], xlab = "Value", freq = FALSE)
      if (!is.null(truth)) abline(v=truth[i],lwd=2,col=2)
    }
    par(op)
  }
  invisible(summ)
}

# eof
