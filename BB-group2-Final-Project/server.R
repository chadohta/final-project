library(shiny)
library(dplyr)

sleeping.data <- read.csv("sleeping.data.csv")

shinyServer(function(input, output) {
  
  output$Intro <- renderText({  
    intro <- readLines("bb-group2-Final-Project/Intro.html")
  })
  
  pieLabels <- c("Strongly disagree", "Somewhat disagree", "Neighter agree nor disagree", "Somewhat agree", "Strongly agree")
  
  stayTogetherSlices <- c(nrow(filter(sleeping.data, col.name == "Strongly disagree")),
                          nrow(filter(sleeping.data, col.name == "Somewhat disagree")),
                          nrow(filter(sleeping.data, col.name == "Neither agree nor disagree")),
                          nrow(filter(sleeping.data, col.name == "Somewhat agree")),
                          nrow(filter(sleeping.data, col.name == "Strongly agree")))
  output$stayTogetherPie <- pie(stayTogetherSlices, labels = pieLabels, main = "\"Sleeping in separate beds helps us to stay
                                together.\"")
  
  betterSleepSlices <- c(nrow(filter(sleeping.data, col.name == "Strongly disagree")),
                         nrow(filter(sleeping.data, col.name == "Somewhat disagree")),
                         nrow(filter(sleeping.data, col.name == "Neither agree nor disagree")),
                         nrow(filter(sleeping.data, col.name == "Somewhat agree")),
                         nrow(filter(sleeping.data, col.name == "Strongly agree")))
  output$betterSleepPie <- pie(betterSleepSlices, lables = pieLables, main = "\"We sleep better when we sleep in separate beds.\"")
  
  improvedSexSlices <- c(nrow(filter(sleeping.data, col.name == "Strongly disagree")),
                         nrow(filter(sleeping.data, col.name == "Somewhat disagree")),
                         nrow(filter(sleeping.data, col.name == "Neither agree nor disagree")),
                         nrow(filter(sleeping.data, col.name == "Somewhat agree")),
                         nrow(filter(sleeping.data, col.name == "Strongly agree")))
  output$improvedSexPie <- pie(improvedSexSlices, labels = pieLables, main = "\"Our sex life has improved as a result of sleeping in
                               separate beds.\"")
})


shinyServer(function(input, output) {
   
  
  
})
