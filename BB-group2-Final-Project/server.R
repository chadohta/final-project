#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

sleeping.data <- read.csv("sleeping.data.csv")
shinyServer(function(input, output) {
  
  output$Intro <- renderText({  
    intro <- readLines("bb-group2-Final-Project/Intro.html")  })
})


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  
})
