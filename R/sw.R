#' User-Friendly Shapiro Wilk Test
#'
#' @param x Must be a numeric vector
#'
#' @returns A list of the test statistic, p-value, and interpretation aid.
#' @export
#'
#' @examples
sw <- function(x){
  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  result <- shapiro.test(x)

  interpretation <- if (result$p.value < 0.05) {
    "The results suggest the data are not normally distributed (p < 0.05)."
  } else {
    "The data appears to be normally distributed (p ≥ 0.05)."
  }

  return(list(
    statistic = result$statistic,
    p_value = result$p.value,
    interpretation = interpretation
  ))
}
