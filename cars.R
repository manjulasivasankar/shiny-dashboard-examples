
library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(title="My first dashboard"),
  dashboardSidebar(
    sidebarMenu(
    menuItem("Iris", tabName = "Iris", icon = icon("tree")),
    menuItem("Cars", tabName = "Cars", icon = icon("Car"))
  )
  ),
  dashboardBody(
    tabItems(
      tabItem("Iris",
              box(plotOutput("correlation_plot"), width=8),
              box(
                selectInput("features","Features:",c("Sepal.Width","Petal.Length","Petal.Width")), width=4
              )
      )
      ),
    
    tabItems("cars",
             fluidPage(
               h1("Cars")
             )
 
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
