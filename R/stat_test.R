#' Statistical Normality Tests for Data
#'
#' This function performs multiple statistical tests to evaluate the normality of a numeric vector.
#' It runs the Shapiro-Wilk, Kolmogorov-Smirnov, and Anderson-Darling tests.
#' @importFrom stats na.omit shapiro.test ks.test sd
#' @importFrom nortest ad.test
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#' @param test A character string specifying which test(s) to run. Defaults to "all". Can be "sw" for Shapiro-Wilk,
#' "ks" for Kolmogorov-Smirnov, or "ad" for Anderson-Darling. You can also specify multiple tests as a vector (e.g., c("sw", "ks")).
#' @examples
#'# Generate normal data
#' data <- rnorm(100)
#' #Run all statistical tests
#' stat_test(data)
#'
#' # Run only the Shapiro-Wilk test
#' stat_test(data, test = "sw")
#'
#' @return A list containing the results of the requested tests and interpretation aids.
#' @export
stat_test <- function(x, test = "all") {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  results <- list()

  if (test == "all" || test == "sw") {
    sw <- shapiro.test(x_clean)
    if (sw$p.value > 0.05) {
      message("Shapiro-Wilk test suggests that the data may follow a normal distribution (p-value = ",
              round(sw$p.value, 4), ")")
    } else {
      message("Shapiro-Wilk test suggests that the data does not follow a normal distribution (p-value = ",
              round(sw$p.value, 4), ")")
    }
    results$shapiro_wilk <- sw
  }

  if (test == "all" || test == "ks") {
    ks <- ks.test(x_clean, "pnorm", mean(x_clean), sd(x_clean))
    if(!is.na(ks$p.value) && !is.null(ks$p.value)) {
      if (ks$p.value > 0.05) {
      message("Kolmogorov-Smirnov test suggests that the data may follow a normal distribution (p-value = ",
              round(ks$p.value, 4), ")")
    } else {
      message("Kolmogorov-Smirnov test suggests that the data does not follow a normal distribution (p-value = ",
              round(ks$p.value, 4), ")")
    }
    } else {
      message("Kolmogorov-Smirnov test could not compute a valid p-value (likely due to equal values in the data.")
    }

    results$kolmogorov_smirnov <- ks
  }

  if (test == "all" || test == "ad") {
    if (!requireNamespace("nortest", quietly = T)) {
      stop("The 'nortest' package is required but not installed.")
    }

    ad <- nortest::ad.test(x_clean)
    if (ad$p.value > 0.05) {
      message("Anderson-Darling test suggests that the data may follow a normal distribution (p-value = ",
              round(ad$p.value, 4), ")")
    } else {
      message("Anderson-Darling test suggests that the data does not follow a normal distribution (p-value = ",
              round(ad$p.value, 4), ")")
    }
    results$anderson_darling <- ad
  }

  return(results)
}
