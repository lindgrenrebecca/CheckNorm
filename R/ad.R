#' Anderson-Darling Test for Normality
#'
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#'
#' @examples
#' #Generate Data
#' data <- rnorm(100)
#' #Run Anderson-Darling Test
#' ad(data)
#'
#'
#'
#' @return A list containing the test result, p-value, and interpretation aid.
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

  # Interpretation
  ad_p_value <- ad_result$p.value
  if (ad_p_value > 0.05) {
    message(paste("The Anderson-Darling test suggests the data follow a normal distribution (p-value =",
                  round(ad_p_value, 4), ")."))
  } else {
    message(paste("The Anderson-Darling test suggests the data does not follow a normal distribution (p-value =",
                  round(ad_p_value, 4), ")."))
  }

return(list(
  statistic = ad_result$statistic,
  p_value = ad_result$p.value))
}
