#' Kolmogorov-Smirnov Test for Normality
#'
#'
#' @importFrom stats ks.test na.omit sd
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#'
#' @examples
#' #Generate data
#' data <- rnorm(100)
#' #Run Kolmogorov-Smirnov Test
#' ks(data)
#'
#'
#'
#' @return An interpretation aid and a list containing the test result and p-value.
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

  #Run KS test
  ks_result <- ks.test(x, "pnorm", mean(x), sd(x))

  # Interpretation
  ks_p_value <- ks_result$p.value

if (ks_p_value > 0.05) {
    message("The Kolmogorov-Smirnov Test suggests the data follow a normal distribution (p-value = ",
                  round(ks_p_value, 4), ").")
  } else {
    message("The Kolmogorov-Smirnov Test suggests the data does not follow a normal distribution (p-value = ",
                  round(ks_p_value, 4), ").")
  }

  return(list(
    statistic = ks_result$statistic,
    p_value = ks_result$p.value))
}

