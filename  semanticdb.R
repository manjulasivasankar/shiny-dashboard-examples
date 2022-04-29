library(shiny)
library(semantic.dashboard)
library(DT)

# Define UI for application that draws a histogram
ui <- dashboardPage( theme = "Slate",
                    dashboardHeader(title="My first dashboard"),
                    dashboardSidebar(
                      sidebarMenu(
                        menuItem("Iris", tabName = "Iris", icon = icon("tree")),
                        menuItem("cars", tabName = "Cars", icon = icon("car")),
                        menuItem("buses", tabName = "Cars", icon = icon("bus"))
                      
                    )),
                    
                    dashboardBody(
                      tabItems(
                        tabItem(tabName ="Iris",
                                box(plotOutput("correlation_plot"), width=8),
                                box(
                                  selectInput("features","Features:",
                                              c("Sepal.Width","Petal.Length","Petal.Width")), width=4
                                )),
                                                
                        tabItem(tabName ="cars",
                                
                                h1("Cars"),
                                dataTableOutput("carstable")
                                
                                
                        ),
                        tabItem(tabName ="buses",
                                box(plotOutput("correlation_plot"), width=8),
                                box(
                                  selectInput("features","Features:",
                                              c("Sepal.Width","Petal.Length","Petal.Width")), width=4
                                )
                                
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
  
  output$carstable <- renderDataTable(mtcars)
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
