

shinyServer(function(input, output){
 
  observeEvent(input$calculate,{
    
    # create the function of the input equation for Bisection, Secant and Uniroot method.
    ftn <- 
      eval(parse(text = paste('f <- function(x) { return(' , input$text , ')}', sep='')))
    
    
    # create the function of the input equation for Newton's method. 
    ftn2 <- 
      eval(parse(text = paste(
        
        'f <- function(x) { 
        
        return(c(',input$text,', eval(D(expression(',input$text,'), "x"))))
        
        }', sep='')))
    
    
      # plot the curve
      output$curve <-  renderPlot({
        
        curve(ftn, -pi, pi, col = 'red', main = paste("Function: ", input$text))
        abline(h = 0, v = secant(ftn, input$num1, input$num2),lty = 3)
        
      })
      
      #plot the barplot
      output$barplot <-  renderPlot({
        


        barplot(c(
                 #fixedpoint(ftn, input$num1)[2],
                 bisection(ftn, x.l = input$num1, x.r = input$num2)[2],
                 secant(ftn, input$num1, input$num2)[1],
                 newtonrapshon(ftn2, 2, 1e-9, max.iter = 100)[2]),
                               names.arg = barplot_x,
               xlab = "Method",
               ylab = "Number of Iteration",
               col = "#249654"
              )
        
      })
      
      # calling uniroot
      output$conversionS <- renderPrint(
        uniroot(ftn, c(input$num1, input$num2))$root)
      
      # calling bisection
      output$iterationB <- renderPrint(
        bisection(ftn, x.l = input$num1, x.r = input$num2)[2])
      
      # calling secant
      output$iterationS <- renderPrint(
        secant(ftn, input$num1, input$num2)[1])
      
      # calling Newton's
      output$iterationN <- renderPrint( 
        newtonrapshon(ftn2, input$num1)[1])

  })
})



