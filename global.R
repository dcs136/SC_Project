options(stringsAsFactors = FALSE)
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)


functions <- 
  data.frame(Functions = c("log(x) + exp(-x)",
                            "cos(x) * x"))




ftn <- function(x) 
  return(x-log(x)+exp(-x))



fixedpoint <- function (ftn, x0, tol = 1e-09, max.iter = 100) 
{
  xold <- x0
  xnew <- ftn(xold)
  iter <- 1
  #cat("At iteration 1 value of x is:", xnew, "\n")
  while ((abs(xnew - xold) > tol) && (iter < max.iter)) {
    xold <- xnew
    xnew <- ftn(xold)
    iter <- iter + 1
  }
  #cat("At iteration", iter, "value of x is:", xnew, "\n")
  if (abs(xnew - xold) > tol) {
    cat("Algorithm failed to converge\n")
    return(NULL)
  }
  else {
    #cat("Algorithm converged\n")
    return(xnew)
  }
}








fixedpoint <- function (ftn, x0, tol = 1e-09, max.iter = 100) 
{
  xold <- x0
  xnew <- ftn(xold)
  iter <- 1
  #cat("At iteration 1 value of x is:", xnew, "\n")
  while ((abs(xnew - xold) > tol) && (iter < max.iter)) {
    xold <- xnew
    xnew <- ftn(xold)
    iter <- iter + 1
  }
  #cat("At iteration", iter, "value of x is:", xnew, "\n")
  if (abs(xnew - xold) > tol) {
    cat("Algorithm failed to converge\n")
    return(NULL)
  }
  else {
    #cat("Algorithm converged\n")
    return(xnew)
  }
}


