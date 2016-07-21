#html 1 hr 40 min mark
tags$h1
tags$h1()
tags$a(href = "www.rstudio.com", "RStudio")

#Nested Tag Function
library(shiny)

ui <- fluidPage(
  tags$h1("First Level"),
  tags$h2("Second Level"),
  tags$h3("Third Level"),
  tags$h4("Fourth Level"),
  tags$h5("Fifth Level"),
  tags$h6("Sixth Level")
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

#---------------

ui <- fluidPage(
  tags$a(href= "http://www.git.com","Git")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
  "This is a Shiny app.",
  "It is also a web page."
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
  tags$p("This is a Shiny app."),
  tags$p("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
  tags$em("This is a Shiny app."),
  tags$em("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
  tags$strong("This is a Shiny app."),
  tags$strong("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
  tags$code("This is a Shiny app."),
  tags$code("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
  tags$p("This is a", 
    tags$strong("Shiny"),
    "app."),
  tags$p("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------1 hr 44min mark
ui <- fluidPage(
  tags$p("This is a", 
         tags$strong("Shiny"),
         "app."),
  tags$br("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------
ui <- fluidPage(
    ("This is a"), 
         tags$strong("Shiny"),
         ("app."),
  tags$hr("It is also a web page.")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------Images
ui <- fluidPage(
  tags$img(height = 100,
      width = 100,
      src = "http://www.rstudio.com/
             images/RStudio.2x.png")
)
server <- function(input, output) {}

shinyApp(ui = ui, server = server)
#-----------------------Images


