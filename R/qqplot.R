#' QQ-Plot
#'
#' @param x Must be a numeric vector.
#'
#' @importFrom stats qqline qqnorm
#' @returns A QQ-Plot
#'
#' @examples
#' #Generate Data
#' data <- rnorm(100)
#' #Plot the QQ-Plot
#' qqplot(data)
#'
#'
#' @export
#'
qqplot <- function(x) {
  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  qqnorm(x, main = "QQ Plot of Sample Data")
  qqline(x, col = "red", lwd = 2)

  message("Within the QQ-Plot, if the data are normally distributed, the points should fall roughly along the red line.")
}
