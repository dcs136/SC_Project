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