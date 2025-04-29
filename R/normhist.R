#' Histogram with Normal Curve Overlay
#'
#' @param x Must be a numeric vector.
#'
#' @importFrom graphics hist curve
#' @importFrom stats dnorm sd
#' @examples
#' # Generate Data
#' data <- rnorm(100)
#' #Plot histogram
#' normhist(data)
#'
#'
#'
#' @return A histogram with a normal curve.
#' @export
normhist <- function(x) {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  hist(x,
       probability = TRUE,  # so y-axis is density, not frequency
       col = "lightblue",
       border = "white",
       main = "Histogram with Normal Curve",
       xlab = "Values")

  curve(dnorm(x, mean = mean(x), sd = sd(x)),
        col = "red",
        lwd = 2,
        add = TRUE)

  message("Within the histogram, if the data are normally distributed, the red normal curve should align well with the shape of the histogram.")
}
