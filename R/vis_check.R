#' Visual Checks for Data Normality
#'
#' This function provides a variety of visual checks to help users evaluate the normality of data.
#' Users can specify which plot to view (e.g., QQ plot, density plot, or histogram) or request all of them.
#'
#' @param x Must be a numeric vector of data values (missing values will be removed automatically).
#' @param plot A character string specifying which plot(s) to show. Defaults to "all". Can be "qq" for QQ plot,
#' "density" for density plot, or "hist" for histogram. Users can specify multiple plots as a vector (e.g., c("qq", "hist")).
#'
#' @return A series of plots and helpful interpretations for understanding data normality.
#' @export
visual_check <- function(x, plot = "all") {

  if (!is.numeric(x)) {
    stop("Input x must be a numeric vector.")
  }

  x_clean <- na.omit(x)
  if (length(x) > length(x_clean)) {
    warning("Missing values detected and removed from the data.")
  }

  # Default to all plots if "all" is specified
  if (plot == "all" || "qq" %in% plot) {
    qqplot(x_clean)
  }

  if (plot == "all" || "density" %in% plot) {
    densplot(x_clean)
  }

  if (plot == "all" || "hist" %in% plot) {
    normhist(x_clean)
  }
}
