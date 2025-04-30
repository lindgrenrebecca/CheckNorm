#' Run a Variety of Statistical Tests and Visual Checks for Data Normality
#'
#' This function combines both statistical tests and visual checks to provide a comprehensive evaluation of the data's normality.
#' It runs the Shapiro-Wilk, Kolmogorov-Smirnov, and Anderson-Darling tests, followed by providing a QQ plot, density plot, and histogram.
#'
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#'
#' @importFrom stats na.omit
#' @examples
#' #Generate Data
#' data <- rnorm(100)
#' #Run all statistical and visual checks
#' check_all(data)
#'
#'
#'
#' @return The results of the statistical tests and visualizations of data normality.
#' @export
check_all <- function(x) {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  # Remove missing values and warn user if any were removed
  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  # Run all statistical tests
  message("Running statistical tests for normality:")
  result <- stat_test(x_clean, test = "all")
  print(result)


  # Run all visual checks
  message("Visualization interpretation aid:")
  vis_check(x_clean, plot = "all")
}
