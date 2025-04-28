#' QQ-Plot
#'
#' @param x Must be a numeric vector.
#'
#' @returns A QQ-Plot
#' @export
#'
#' @examples
qqplot <- function(x) {
  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  qqnorm(x, main = "QQ Plot of Sample Data")
  qqline(x, col = "red", lwd = 2)

  message("Within the QQ-Plot, if the data are normally distributed, the points should fall roughly along the red line.")
}
