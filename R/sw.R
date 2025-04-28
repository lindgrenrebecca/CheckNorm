#' Shapiro-Wilk Test
#'
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#'
#' @returns A list of the test statistic, p-value, and interpretation aid.
#' @export
#'
#' @examples
sw <- function(x){
  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }


  # Remove missing values and warn user if any were removed
  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  sw_result <- shapiro.test(x)

  sw_p_value <- sw_result$p.value

  sw_interpretation <- if (sw_p_value > 0.05) {
    paste("The Shapiro-Wilk test suggests the data follow a normal distribution (p-value =",
                  round(sw_p_value, 4), ").")
  } else {
    paste("The Shapiro-Wilk test suggests the data does not follow a normal distribution (p-value =",
                  round(sw_p_value, 4), ").")
  }

  message(sw_interpretation)

  return(list(
    statistic = sw_result$statistic,
    p_value = sw_result$p.value
  ))
}
