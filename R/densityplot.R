#' Density Plot
#'
#' @param x Must be a numeric vector.
#'
#' @return A density plot
#' @export
densplot <- function(x) {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  plot(density(x),
       main = "Density Plot of Sample Data",
       xlab = "Values",
       ylab = "Density",
       col = "blue",
       lwd = 2)

  message("Within the density plot, a bell-shaped, symmetric curve suggests normality. Look for skewness or multi-modal patterns that may indicate non-normality.")
}
