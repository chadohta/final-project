library(shiny)

sleeping.data <- read.csv("sleeping.data.csv")
shinyServer(function(input, output) {
  
  output$Intro <- renderText({  
    intro <- readLines("bb-group2-Final-Project/Intro.html")  })
})


shinyServer(function(input, output) {
   
  
  
})
