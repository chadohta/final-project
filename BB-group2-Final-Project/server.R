library(shiny)
library(dplyr)
library(ggplot2)
library(stringr) 
library(tidyr)

# Read in the file and change column names
sleeping.data <- read.csv(file = "sleeping.data.csv", header = TRUE, sep = ",")
colnames(sleeping.data) <- c("StartDate", "EndDate", "RelationshipStatus", "CurrentRelationshipLength", "HowOftenSleepingSeparate", 
                             "WhereDoYouSleep", "Other1", "WherePartnerSleeps", "Other2", "Reasons", "R1", "R2", "R3", "R4", "R5",
                             "R6", "R7", "R8", "R9", "R10", "FirstTimeSleepingSep", "SepHelpsUsStayTogether", "SepHelpsMeSleepBetter",
                             "SepImprovesSexLife", "Occupation", "O1", "Gender", "Age", "HouseholdIncome", "Education", "Location")
sleeping.data <- sleeping.data[-(1), ] # Remove header row with ("Response")


shinyServer(function(input, output) {
  
  output$Intro <- renderText({  
    intro <- readLines("bb-group2-Final-Project/Intro.html")
  })
  
  pieLabels <- c("Strongly disagree", "Somewhat disagree", "Neighter agree nor disagree", "Somewhat agree", "Strongly agree")
  
  stayTogetherSlices <- c(nrow(filter(sleeping.data, SepHelpsUsStayTogether == "Strongly disagree")),
                          nrow(filter(sleeping.data, SepHelpsUsStayTogether == "Somewhat disagree")),
                          nrow(filter(sleeping.data, SepHelpsUsStayTogether == "Neither agree nor disagree")),
                          nrow(filter(sleeping.data, SepHelpsUsStayTogether == "Somewhat agree")),
                          nrow(filter(sleeping.data, SepHelpsUsStayTogether == "Strongly agree")))
  output$stayTogetherPie <- pie(stayTogetherSlices, labels = pieLabels, main = "\"Sleeping in separate beds helps us to stay
                                together.\"")
  
  betterSleepSlices <- c(nrow(filter(sleeping.data, SepHelpsMeSleepBetter == "Strongly disagree")),
                         nrow(filter(sleeping.data, SepHelpsMeSleepBetter == "Somewhat disagree")),
                         nrow(filter(sleeping.data, SepHelpsMeSleepBetter == "Neither agree nor disagree")),
                         nrow(filter(sleeping.data, SepHelpsMeSleepBetter == "Somewhat agree")),
                         nrow(filter(sleeping.data, SepHelpsMeSleepBetter == "Strongly agree")))
  output$betterSleepPie <- pie(betterSleepSlices, labels = pieLabels, main = "\"We sleep better when we sleep in separate beds.\"")
  
  improvedSexSlices <- c(nrow(filter(sleeping.data, SepImprovesSexLife == "Strongly disagree")),
                         nrow(filter(sleeping.data, SepImprovesSexLife == "Somewhat disagree")),
                         nrow(filter(sleeping.data, SepImprovesSexLife == "Neither agree nor disagree")),
                         nrow(filter(sleeping.data, SepImprovesSexLife == "Somewhat agree")),
                         nrow(filter(sleeping.data, SepImprovesSexLife == "Strongly agree")))
  output$improvedSexPie <- pie(improvedSexSlices, labels = pieLables, main = "\"Our sex life has improved as a result of sleeping in
                               separate beds.\"")
  
  # DataFrame alterations for Background Graph
  sleeping.data$CurrentRelationshipLength <- str_replace_all(sleeping.data$CurrentRelationshipLength, "Less than 1 year", "0-1 year")
  sleeping.data$CurrentRelationshipLength[sleeping.data$CurrentRelationshipLength == ""] <- 'No Response'
  
  # Plotting code for background information graph
  output$backgroundGraph <- renderPlot({
    ggplot(data = sleeping.data) + geom_bar(mapping = aes_string(x = input$dataVariable, fill = input$dataVariable)) +
      ggtitle("Testing") + labs(x = "Variable", y = "Count") + coord_flip()
  })
  
  output$backgroundPie <- renderPlot({
    ggplot(data = sleeping.data) + geom_bar(mapping = aes_string(x = input$ageOrGender, fill = input$ageOrGender))+
      coord_polar("y") + ggtitle("Test Pie")
  })
  
})
