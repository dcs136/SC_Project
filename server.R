# library(shiny)
# library(shinydashboard)
# library(spuRs)
# library(cmna)

shinyServer(function(input, output){
 
  observeEvent(input$calculate,{
    ftn <- 
      eval(parse(text = paste('f <- function(x) { return(' , input$text , ')}', sep='')))
    
    # Ifelse statements are used to link the functions.
    #input$num1
      output$curve <-  renderPlot({
        #renderText(bisection(eval(input$text), 0, 2.5)[2])
        ggplot(data.frame(x = c(-5, 5)), aes(x = x)) +
          stat_function(fun = ftn)+
          scale_x_continuous(name = "X-axis")+
          scale_y_continuous(name = "Y-axis")+
          ggtitle("Function")+
          #  ccolour = "#4271AE") +
          theme_bw()



        # curve(expr = ftn, col='blue', lwd=2, lty=2, xlim=c(-4,4))
        # abline(h=0)
        # abline(v=0)

      })
      output$iteration <- renderPrint(
        bisection(ftn, x.l = input$num1, x.r = input$num2)[1])
      output$convertion <- renderPrint(
        bisection(ftn, x.l = input$num1, x.r = input$num2)[2])
    
    # if (input$equation ==  "log(x) + exp(-x)") { 
    #   ftn <- function(x) 
    #     return(log(x)^3 + exp(-x)^2)
    #   
    #   x0 <- input$num1
    #   output$curve <- renderPlot({
    #     
    #     ggplot(data.frame(x = c(-5, 5)), aes(x = x)) +
    #       stat_function(fun = ftn)+
    #       scale_x_continuous(name = "X-axis")+
    #       scale_y_continuous(name = "Y-axis")+
    #       ggtitle("Function")+
    #       #  ccolour = "#4271AE") +
    #       theme_bw()
    #     
    #     
    #     
    #     # curve(expr = ftn, col='blue', lwd=2, lty=2, xlim=c(-4,4))
    #     # abline(h=0)
    #     # abline(v=0)
    #     
    #     })
    #   output$iteration <- renderPrint( 
    #     fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100))
    # }
    # 
    # else if (input$equation == "cos(x) * x") { 
    #   ftn <- function(x) 
    #     return(cos(x))
    #   
    #   x0 <- input$num1
    #   
    #   output$convertion <- renderPrint( 
    #   fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100)[1])
    # 
    #   output$iteration <- renderPrint( 
    #     fixedpoint(ftn, x0, tol = 1e-9, max.iter = 100)[2])
    #   
    #   
    #   output$curve <- renderPlot({
    #     # curve(expr = ftn, col='blue', lwd=2, lty=2, xlim=c(-4,4))
    #     # abline(h=0)
    #     # abline(v=0)
    #     
    #     ggplot(data.frame(x = c(-5, 5)), aes(x = x)) +
    #       stat_function(fun = ftn)+
    #       scale_x_continuous(name = "X-axis")+
    #       scale_y_continuous(name = "Y-axis")+
    #       ggtitle("Function")+
    #       #  ccolour = "#4271AE") +
    #       theme_bw()
    #     
    #   })
    #  }
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
