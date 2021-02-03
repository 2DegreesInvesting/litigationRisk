#' Run app
#'
#' @export
#'
#' @examples
#' run_app()
run_app <- function() {
  ui <- fluidPage(
    DT::dataTableOutput("dt")
  )

  server <- function(input, output, session) {
    data <- reactive({
      dataset <- "mtcars.csv"
      path <- system.file("extdata", dataset, package = "litigationRisk")
      read.csv(path)
    })

    output$dt <- DT::renderDataTable(
      data(),
      filter = list(position = "top", clear = FALSE)
    )
  }

  shinyApp(ui, server)
}
