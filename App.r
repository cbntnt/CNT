library(shiny)

ui <- fluidPage(sliderInput(inputId = "num",
                            label = "Choose a number",
                            value = 25, min = 1, max = 100),
                plotOutput("hist")
)

# 100 Random Normal Values
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}
shinyApp(ui = ui, server = server)

