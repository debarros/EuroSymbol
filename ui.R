library(shiny)
source("functions.R")

choiceList = as.list(c("INCOME_MGL",
                       "INCOME_MGL€",
                       "INCOME_MGL&euro;",
                       "INCOME_MGL&#8364;"))

names(choiceList) = c("INCOME_MGL",
                      "INCOME_MGL€",
                      "INCOME_MGL&euro;",
                      "INCOME_MGL&#8364;")

shinyUI(navbarPage(title = 'shoe euro',          
                            radioButtons2(
                              inputId = 'var', 
                              label = 'var',  
                              choices = choiceList
                            )
                            
))