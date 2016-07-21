#Trigger Code. user will never see code. Code is triggered from server side. The server will handle the code. It could be writing a new file to save for later
#Trigger code on the server side based on changes with the input objects
#downloading a file for user to use. 
#use an Action button
#1hr and 12 min mark
#observeEvent, vector of reactive values to respond to. triggers code to run on the server
#observe
#Quandl
# 05-actionButton
library(shiny)

ui <- fluidPage(
  actionButton(inputId = "clicks",
              label = "Click me")
)

server <- function(input, output) {
  observeEvent(input$clicks, {
    print(as.numeric(input$clicks))
  })
}

shinyApp(ui = ui, server = server)

#------------------------------------------------

#eventReactive() expression invalidates ONLY when this value changes )input$go
# 07-eventReactive; Output depends on button update click
library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min=1, max=100),
  actionButton(inputId = "go",
               label = "Update"),
              plotOutput("hist")
)

server <- function(input, output) {
  data <- eventReactive(input$go, {
    rnorm(input$num)
  })
  output$hist <- renderPlot({
    hist(data())
  })
}

shinyApp(ui = ui, server = server)
#--------------------------------------------
# 08 - ReactiveValues

library(shiny)
ui <- fluidPage(
  actionButton(inputId = "norm", label = "Normal"),
  actionButton(inputId = "unif", label = "Uniform"),
  plotOutput("hist")
)
server <- function(input, output) {
  
  rv <- reactiveValues(data = rnorm(100))
  
  observeEvent(input$norm, {rv$data <- rnorm(100) })
  observeEvent(input$unif, {rv$data <- runif(100) })
  
  output$hist <- renderPlot({
    hist(rv$data)
  })
}

shinyApp(ui = ui, server = server)

  
  
  


