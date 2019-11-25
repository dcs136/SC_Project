library(shiny)
library(shinydashboard)
library(spuRs)
library(cmna)

shinyServer(function(input, output){
  
  date_range <- reactive({
    
    if (input$state_b ==  "log(x) + exp(-x)") {
      
      ftn <- function(x) 
        return(x-log(x)+exp(-x))
    }
    
    output$curve <- renderPlot({
      curve(ftn)  
    })
    
    x0 <- input$num1 
    output$iteration <- renderPrint( 
      fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100))
  }
  )
}
)
#ftn <- function(x) return(x-log(x)+exp(-x))
