library(shiny)
library(dplyr)
library(ggplot2)
library(stringr) 
library(tidyr)

sleeping.data <- read.csv(file = "sleeping.data.csv", header = TRUE, sep = ",")
colnames(sleeping.data) <- c("StartDate", "EndDate", "RelationshipStatus", "CurrentRelationshipLength", "HowOftenSleepingSeparate", 
                             "WhereDoYouSleep", "Other1", "WherePartnerSleeps", "Other2", "Reasons", "R1", "R2", "R3", "R4", "R5",
                             "R6", "R7", "R8", "R9", "R10", "FirstTimeSleepingSep", "SepHelpsUsStayTogether", "SepHelpsMeSleepBetter",
                             "SepImprovesSexLife", "Occupation", "O1", "Gender", "Age", "HouseholdIncome", "Education", "Location")

sleeping.data <- sleeping.data[-(1), ]
sleeping.data$CurrentRelationshipLength <- str_replace_all(sleeping.data$CurrentRelationshipLength, "Less than 1 year", "0-1 year")
sleeping.data$CurrentRelationshipLength[sleeping.data$CurrentRelationshipLength == ""] <- 'No Response'





shinyServer(function(input, output) {
   
  output$backgroundGraph <- renderPlot({
    ggplot(data = sleeping.data) + geom_bar(mapping = aes_string(x = input$dataVariable, fill = input$dataVariable)) +
      ggtitle("Testing") + labs(x = "Variable", y = "Count") + coord_flip()
  })
  
})
