# library(shiny)
# library(shinydashboard)
# library(spuRs)
# library(cmna)


shinyServer(function(input, output){
 
  observeEvent(input$calculate,{
    
    # Ifelse statements are used to link the functions.
    
    if (input$equation ==  "log(x) + exp(-x)") { 
      ftn <- function(x) 
        return(log(x)^3 + exp(-x)^2)
      
      x0 <- input$num1
      output$curve <- renderPlot({
        curve(expr = ftn, col='blue', lwd=2, lty=2, xlim=c(-4,4))
        abline(h=0)
        abline(v=0)
        
        })
      output$iteration <- renderPrint( 
        fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100))
    }
    
    else if (input$equation == "cos(x) * x") { 
      ftn <- function(x) 
        return(cos(x))
      
      x0 <- input$num1
      output$iteration <- renderPrint( 
        fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100))
      
      output$curve <- renderPlot({
        curve(expr = ftn, col='blue', lwd=2, lty=2, xlim=c(-4,4))
        abline(h=0)
        abline(v=0)
        
      })
    }
  })
})
#   output$Area_ui_b <- renderUI({
#     func_choices <- functions %>%
#       filter(functions == input$equation) %>%
#       select(functions)
#   
#   
#   dataInput <- reactive({
#     filter_dat <- functions[functions$Functions == input$equation, ]
#     
#   })
#   
#   #date_range <- reactive({
#     
#     # if (input$equation ==  "log(x) + exp(-x)") {
#       
#       # ftn <- function(x) 
#       #   return(x-log(x)+exp(-x))
#     # }
#     output$curve <- renderPlot({
#       curve(ftn)  
#     })
#     
#     x0 <- input$num1 
#     output$iteration <- renderPrint( 
#       fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100))
#   }
#   )
# 
# #ftn <- function(x) return(x-log(x)+exp(-x))
