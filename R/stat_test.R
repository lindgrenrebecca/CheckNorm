#' Statistical Normality Tests for Data
#'
#' This function performs multiple statistical tests to evaluate the normality of a numeric vector.
#' It runs the Shapiro-Wilk, Kolmogorov-Smirnov, and Anderson-Darling tests, based on the user's request.
#'
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#' @param test A character string specifying which test(s) to run. Defaults to "all". Can be "sw" for Shapiro-Wilk,
#' "ks" for Kolmogorov-Smirnov, or "ad" for Anderson-Darling. You can specify multiple tests as a vector (e.g., c("sw", "ks")).
#'
#' @return A list containing the results of the requested tests and a friendly interpretation message.
#' @export
stat_test <- function(x, test = "all") {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  run_tests <- function() {
    results <- list()

    #Shapiro-Wilk Test
    if (test == "all" || "sw" %in% test) {
      sw_result <- shapiro.test(x_clean)
      results$shapiro_wilk <- sw_result
    }

    # Kolmogorov-Smirnov test
    if (test == "all" || "ks" %in% test) {
      ks_result <- ks.test(x_clean, "pnorm", mean(x_clean), sd(x_clean))
      results$kolmogorov_smirnov <- ks_result
    }

    # Anderson-Darling test
    if (test == "all" || "ad" %in% test) {
      if (!requireNamespace("nortest", quietly = TRUE)) {
        stop("The 'nortest' package is required for the Anderson-Darling test.")
      }
      ad_result <- nortest::ad.test(x_clean)
      results$anderson_darling <- ad_result
    }

    return(results)
  }

  # Get the test results
  test_results <- run_tests()

  # Print the results
  for (test_name in names(test_results)) {
    print(test_results[[test_name]])
  }

  # Interpretation
  message("Based on the results of the following tests:")

  for (test_name in names(test_results)) {
    p_value <- test_results[[test_name]]$p.value
    if (p_value > 0.05) {
      message(paste(test_name, "suggests that the data may follow a normal distribution (p-value =", round(p_value, 4), ")."))
    } else {
      message(paste(test_name, "suggests that the data does not follow a normal distribution (p-value =", round(p_value, 4), ")."))
    }
  }

  message("Consider these results alongside visualizations for a more robust understanding of your data.")

  # Return results invisibly so it doesn't print twice if assigned
  invisible(test_results)
}
