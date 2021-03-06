plot_var <- function() {
  "mpg"
}

dataset <- function(file = "mtcars.csv") {
  path <- system.file("extdata", file, package = "litigationRisk")
  read.csv(path)
}

select_label <- function(facet) {
  sprintf("Select the values of '%s' you want to plot", facet)
}

histogramUI <- function(id, facet) {
  choices <- unique(dataset()[[facet]])
  tabPanel(
    facet,
    selectInput(NS(id, "var"), select_label(facet), choices),
    plotOutput(NS(id, "hist")),
    p(sprintf("'%s' for the values of '%s' you selected.", plot_var(), facet))
  )
}

histogramServer <- function(id, facet) {
  moduleServer(id, function(input, output, session) {
    data <- reactive({
      df <- dataset()
      pick <- df[[facet]] == input$var
      subset(df, subset = pick, select = plot_var(), drop = TRUE)
    })

    output$hist <- renderPlot({
      hist(data(), main = input$var)
    }, res = 96)
  })
}
