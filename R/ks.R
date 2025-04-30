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


  if(!is.na(ks_result$p.value) && !is.null(ks_result$p.value)) {
    if (ks_result$p.value > 0.05) {
      message("Kolmogorov-Smirnov test suggests that the data may follow a normal distribution (p-value = ",
              round(ks_result$p.value, 4), ")")
    } else {
      message("Kolmogorov-Smirnov test suggests that the data does not follow a normal distribution (p-value = ",
              round(ks_result$p.value, 4), ")")
    }
  } else {
    message("Kolmogorov-Smirnov test could not compute a valid p-value (likely due to equal values in the  data.")
  }

  return(list(
    statistic = ks_result$statistic,
    p_value = ks_result$p.value))
}

