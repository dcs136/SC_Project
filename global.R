
# run packages
options(stringsAsFactors = FALSE)
library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)

# x lable for the barplot
barplot_x <- c("Uniroot","Bisection", "Secant","Newton")


# fixedPoint Method edited 
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
    return(cat("Failed"))
  }
  else {
    #cat("Algorithm converged\n")
    return(c(" " = xnew, " " =iter))
  }
}


# Bisection Method edited
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
  return(c(" " =n, " " =(x.l + x.r)/2))
}

# Secant Method edited

secant <- function(ftn, x0, x1, tol = 1e-9, max.iter = 100) {
  # secant algorithm for solving ftn(x) == 0
  # we assume that ftn is a function of a single variable that returns
  # the function value
  #
  # x0 and x1 are two initial guesses at the root
  # the algorithm terminates when the function value is within distance
  # tol of 0, or the number of iterations exceeds max.iter
  
  # initialise
  f0 <- ftn(x0)
  f1 <- ftn(x1)
  iter <-  0
  
  # continue iterating until stopping conditions are met
  while ((abs(f1) > tol) && (iter < max.iter)) {
    if (f0 == f1) {
    #  cat("Algorithm failed with f0 == f1\n")
      return(NULL)
    }
    x2 <- x1 - f1*(x1 - x0)/(f1 - f0)
    x0 <- x1
    f0 <- f1
    x1 <- x2
    f1 <- ftn(x1)
    iter <-  iter + 1
   # cat("At iteration", iter, "approximation is:", x1, "\n")
  }
  
  # output depends on success of algorithm
  if (abs(f1) > tol) {
    cat("Failed\n")
    return(NULL)
  } else {
   # cat("Algorithm converged\n")
    return(c(" " = x1, " " = iter))
  }
}

# Newtonrapshon Method edited

newtonrapshon <- function (ftn, x0, tol = 1e-09, max.iter = 100) 
{
  x <- x0
  fx <- ftn(x)
  iter <- 0
  while ((abs(fx[1]) > tol) && (iter < max.iter)) {
    x <- x - fx[1]/fx[2]
    fx <- ftn(x)
    iter <- iter + 1
    #at("At iteration", iter, "value of x is:", x, "\n")
  }
  if (abs(fx[1]) > tol) {
    #cat("Algorithm failed to converge\n")
    return(NULL)
  }
  else {
    #cat("Algorithm converged\n")
    return(c(" " = x, " " = iter))
  }
}


