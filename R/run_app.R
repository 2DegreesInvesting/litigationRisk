#' litigationRisk app
#'
#' @return Called for its side effect.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   run_app()
#' }
run_app <- function() {
  ui <- fluidPage(
    tabsetPanel(
      id = "tab",
      histogramUI("hist1", facet = "cyl"),
      histogramUI("hist2", facet = "carb"),
      histogramUI("hist3", facet = "gear")
    )
  )

  server <- function(input, output, session) {
    histogramServer("hist1", facet = "cyl")
    histogramServer("hist2", facet = "carb")
    histogramServer("hist3", facet = "gear")
  }

  shinyApp(ui, server)
}
