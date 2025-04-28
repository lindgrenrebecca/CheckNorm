#' Anderson-Darling Test for Normality
#'
#' @param x Must be a numeric vector.
#'
#' @return A list containing the test result.
#' @export
#'
ad <- function(x) {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  if (!requireNamespace("nortest", quietly = TRUE)) {
    stop("The 'nortest' package is required but not installed.")
  }

  ad_result <- nortest::ad.test(x)

  print(ad_result)

  message("If the p-value is greater than 0.05, this suggests the data may come from a normal distribution.
The Anderson-Darling test gives additional weight to the tails of the distribution, making it sensitive to deviations in the extremes.
The 'A' statistic represents the overall difference between the sample's cumulative distribution and a normal distribution, with higher values indicating a larger discrepancy.
Consider using this test alongside other normality tests and visualizations.")

  invisible(ad_result)
}
