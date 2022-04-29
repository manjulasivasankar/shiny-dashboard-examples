#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
      dashboardHeader(title="My first dashboard"),
      dashboardSidebar(),
      dashboardBody(
        box(plotOutput("correlation_plot"), width=8),
        box(
          selectInput("features","Features:",c("Sepal.Width","Petal.Length","Petal.Width")),width=4
        )
      )
  

    
    )



# Define server logic required to draw a histogram
server <- function(input, output) {

    output$correlation_plot <- renderPlot({
      
        plot(iris$Sepal.Length, iris[[input$features]], 
             xlab="Sepal length", ylab="Features")
      }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
