shinyServer(function(input, output){
 
  observeEvent(input$calculate,{
    ftn <- 
      eval(parse(text = paste('f <- function(x) { return(' , input$text , ')}', sep='')))
    
    ftn2 <- 
      eval(parse(text = paste(
        
        'f <- function(x) { 
        
        return(c(',input$text,', eval(D(expression(',input$text,'), "x"))))
        
        }', sep='')))
    

      output$curve <-  renderPlot({
        
        curve(ftn, -pi, pi, col = 'red', main = paste("Function: ", input$text))
        abline(h = 0, v = secant(ftn, input$num1, input$num2),lty = 3)

      })
      
      output$conversionS <- renderPrint(
        secant(ftn, input$num1, input$num2)[2])
      
      
      output$iterationF <- renderPrint(
        fixedpoint(ftn, input$num1)[2])
      
      output$iterationB <- renderPrint(
        bisection(ftn, x.l = input$num1, x.r = input$num2)[1])
      

      output$iterationS <- renderPrint(
        secant(ftn, input$num1, input$num2)[2])
      
      output$iterationN <- renderPrint( 
        newtonrapshon(ftn2, input$num1)[2])
   

  })
})
