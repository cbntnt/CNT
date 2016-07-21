library(shiny)
ui <- fluidPage("Hello World")

server <- function(input,output) {}
shinyApp(ui = ui, server = server)

sliderInput(inputId = "num",
            label = "Choose a number",
            value = 25, min = 1, max = 100)

ui <- fluidPage(sliderInput(inputId = "num",
                label = "Choose a number",
                value = 25, min = 1, max = 100),
                plotOutput("hist")
                )
server <- function(input,output) {}
shinyApp(ui = ui, server = server)


ui <- fluidPage(sliderInput(inputId = "num",
                            label = "Choose a number",
                            value = 25, min = 1, max = 100),
                plotOutput("hist")
)

# 100 Random Normal Values
server <- function(input, output) {
  output$hist <- renderPlot({
    title <- "100 random normal values"
    hist(rnorm(100), main = title)
    })
}
shinyApp(ui = ui, server = server)

# Share app at 26min mark of video


