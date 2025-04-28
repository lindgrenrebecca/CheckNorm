#' Kolmogorov-Smirnov Test for Normality
#'
#' @param x Must be a numeric vector.
#'
#' @return A list containing the test result.
#' @export
#'
ks <- function(x) {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }


  # Remove missing values and warn user if any were removed
  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  ks_result <- ks.test(x, "pnorm", mean(x), sd(x))

  print(ks_result)

  message("A p-value greater than 0.05 suggests the data may come from a normal distribution. The 'D' statistic represents the largest difference between the sample's cumulative distribution and a normal distribution.
It ranges from 0 to 1 where a larger 'D' values indicate a greater deviation from normality.
However, the K-S test is sensitive to sample size, so make sure to consider it alongside visualizations and other tests.")

  invisible(ks_result)
}
