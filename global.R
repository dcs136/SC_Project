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
  return(cos(x) * 2)



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
    return(c(xnew, iter))
  }
}


fixedpoint(ftn, 1, tol = 1e-9, max.iter = 100)[1]


fixedpoint(ftn, 1, tol = 1e-9, max.iter = 100)[2]


bisection <- function (ftn, x.l, x.r, tol = 1e-09) 
{
  if (x.l >= x.r) {
    #cat("error: x.l >= x.r \n")
    return(NULL)
  }
  f.l <- ftn(x.l)
  f.r <- ftn(x.r)
  if (f.l == 0) {
    return(x.l)
  }
  else if (f.r == 0) {
    return(x.r)
  }
  else if (f.l * f.r > 0) {
    #cat("error: ftn(x.l) * ftn(x.r) > 0 \n")
    return(NULL)
  }
  n <- 0
  while ((x.r - x.l) > tol) {
    x.m <- (x.l + x.r)/2
    f.m <- ftn(x.m)
    if (f.m == 0) {
      return(x.m)
    }
    else if (f.l * f.m < 0) {
      x.r <- x.m
      f.r <- f.m
    }
    else {
      x.l <- x.m
      f.l <- f.m
    }
    n <- n + 1
    #cat("at iteration", n, "the root lies between", x.l, 
     #   "and", x.r, "\n")
  }
  return(c(n, (x.l + x.r)/2))
}



