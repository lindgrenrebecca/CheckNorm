#' Anderson-Darling Test for Normality
#'
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#'
#' @return A list containing the test result and interpretation aid.
#' @export
#'
ad <- function(x) {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  if (!requireNamespace("nortest", quietly = TRUE)) {
    stop("The 'nortest' package is required but not installed.")
  }


  # Remove missing values and warn user if any were removed
  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  ad_result <- nortest::ad.test(x)

  print(ad_result)

  message("If the p-value is greater than 0.05, this suggests the data may come from a normal distribution.
The Anderson-Darling test gives additional weight to the tails of the distribution, making it sensitive to deviations in the extremes.
The 'A' statistic represents the overall difference between the sample's cumulative distribution and a normal distribution, with higher values indicating a larger discrepancy.
Consider using this test alongside other normality tests and visualizations.")

  invisible(ad_result)
}
