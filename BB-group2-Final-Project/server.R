library(shiny)
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)
library(scales)
library(RColorBrewer)

# Read in the file and change column names
sleeping.data <- read.csv(file = "sleeping.data.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
colnames(sleeping.data) <- c("StartDate", "EndDate", "RelationshipStatus", "CurrentRelationshipLength", "HowOftenSleepingSeparate",
                             "WhereDoYouSleep", "Other1", "WherePartnerSleeps", "Other2", "Reasons", "R1", "R2", "R3", "R4", "R5",
                             "R6", "R7", "R8", "R9", "R10", "FirstTimeSleepingSep", "SepHelpsUsStayTogether", "SepHelpsMeSleepBetter",
                             "SepImprovesSexLife", "Occupation", "O1", "Gender", "Age", "HouseholdIncome", "Education", "Location")
sleeping.data <- sleeping.data[-(1), ] # Remove header row with ("Response")


shinyServer(function(input, output) {

  # --------------------------------------------Introduction-----------------------------------------------------------------


  # --------------------------------------------Background Information-------------------------------------------------------
  # DataFrame alterations for Background Graph
  sleeping.data$CurrentRelationshipLength <- str_replace_all(sleeping.data$CurrentRelationshipLength, "Less than 1 year", "0-1 year")
  sleeping.data$CurrentRelationshipLength[sleeping.data$CurrentRelationshipLength == ""] <- 'No Response'
  sleeping.data$Education[sleeping.data$Education == ""] <- 'No Response'
  sleeping.data$HouseholdIncome[sleeping.data$HouseholdIncome == ""] <- 'No Response'

  # Reordering the levels (order) of the Education and Household Income columns
  sleeping.data$Education <- factor(sleeping.data$Education, levels = c("Less than high school degree",
                                                                        "High school degree", "Some college or Associate degree",
                                                                        "Bachelor degree",
                                                                        "Graduate degree",
                                                                        "No Response"))
  sleeping.data$HouseholdIncome <- factor(sleeping.data$HouseholdIncome, levels = c("$0 - $24,999",
                                                                                    "$25,000 - $49,999",
                                                                                    "$50,000 - $99,999",
                                                                                    "$100,000 - $149,999",
                                                                                    "$150,000+",
                                                                                    "No Response"))

  # Plotting code for background information graph
  output$backgroundGraph <- renderPlot({
    ggplot(data = sleeping.data) + geom_bar(mapping = aes_string(x = input$dataVariable, fill = input$dataVariable)) +
      ggtitle("Background Information") + labs(x = "Variable", y = "Count") + coord_flip() +
      theme(panel.background = element_rect(fill = 'grey')) +
      scale_fill_manual(values=c("#FF8C94", "#FFAAA6", "#FFD3B5", "#DCEDC2", "#A8E6CE", "#C4FAF8", "#ACE7FF"))
  })

  # DataFrome alterations for Background Pie Chart
  sleeping.data$Gender[sleeping.data$Gender == ""] <- 'No Response'
  sleeping.data$Age[sleeping.data$Age == ""] <- 'No Response'

  # Reordering the levels (order) of the Gender and Age columns
  sleeping.data$Gender <- factor(sleeping.data$Gender, levels = c("No Response",
                                                                  "Female",
                                                                  "Male"))
  sleeping.data$Age <- factor(sleeping.data$Age, levels = c("No Response",
                                                            "18-29",
                                                            "30-44",
                                                            "45-60",
                                                            "> 60"))

  # Create a blank theme for piechart
  blank_theme <- theme_minimal() + theme(
      plot.title = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      panel.border = element_blank(),
      panel.grid = element_blank(),
      axis.ticks = element_blank()
    )

  # Plotting code for background information pie chart
  output$backgroundPie <- renderPlot({
    ggplot(data = sleeping.data, aes_string(x = factor(input$ageOrGender), fill = input$ageOrGender)) +
      geom_bar(width = 1) +
      coord_polar("y") +
      blank_theme +
      scale_fill_manual(values=c("#CCCCCC", "#FF9999", "#33CCFF", "#3399CC", "#33CCCC"))
  })
  # --------------------------------------------Graph Tab 1-----------------------------------------------------------------

  sleeping.data.stacked <- select(sleeping.data, Reasons, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10)
  sleeping.data.stacked <- stack(sleeping.data.stacked)
  sleeping.data.stacked <- select(sleeping.data.stacked, values)
  sleeping.data.stacked <- filter(sleeping.data.stacked, values != "")
  sleeping.data.stacked$values[sleeping.data.stacked$values == "Other (please specify)"] <- 'Other'
  output$graph1Bar <- renderPlot({
    ggplot(sleeping.data.stacked) + geom_bar(aes(x = values, fill= values)) + coord_flip() + guides(fill=FALSE) +
      scale_fill_manual(values=c("#FF8C94", "#FFAAA6", "#FFD3B5", "#DCEDC2", "#A8E6CE", "#C4FAF8", "#ACE7FF", "#85E3FF",
                                 "#6EB5FF", "#DCD3FF", "#B5B9FF"))

  })
  
  # --------------------------------------------Graph Tab 2-----------------------------------------------------------------
  # Pie chart 1
  sleeping.data$SepHelpsUsStayTogether <- factor(sleeping.data$SepHelpsUsStayTogether,
         levels = c("Strongly agree", "Somewhat agree", "Neither agree nor disagree", "Somewhat disagree", "Strongly disagree"))
  output$stayTogetherPie <- renderPlot({
    ggplot(
      data = filter(sleeping.data, SepHelpsUsStayTogether != ""),
      aes_string(x = factor("SepHelpsUsStayTogether"), fill = "SepHelpsUsStayTogether")) +
      geom_bar(width = 1) +
      ggtitle("\"Sleeping in separate beds helps us to stay together.\"") + 
      coord_polar("y") + 
      scale_fill_brewer(palette="Blues") +
      theme_minimal() + 
      theme(
        axis.title = element_blank(),
        panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_blank(),
        axis.text = element_blank())
  })
  
  #Pie chart 2
  sleeping.data$SepHelpsMeSleepBetter <- factor(sleeping.data$SepHelpsMeSleepBetter,
        levels = c("Strongly agree", "Somewhat agree", "Neither agree nor disagree", "Somewhat disagree", "Strongly disagree"))
  output$betterSleepPie <- renderPlot({
    ggplot(
      data = filter(sleeping.data, SepHelpsMeSleepBetter != ""),
      aes_string(x = factor("SepHelpsMeSleepBetter"), fill = "SepHelpsMeSleepBetter")) +
      geom_bar(width = 1) +
      ggtitle("\"We sleep better when we sleep in separate beds.\"") + 
      coord_polar("y") + 
      scale_fill_brewer(palette="Blues") +
      theme_minimal() + theme(
        axis.title = element_blank(),
        panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_blank(),
        axis.text = element_blank())
  })
  
  #Pie chart 3
  sleeping.data$SepImprovesSexLife <- factor(sleeping.data$SepImprovesSexLife,
        levels = c("Strongly agree", "Somewhat agree", "Neither agree nor disagree", "Somewhat disagree", "Strongly disagree"))
  output$improvedSexPie <- renderPlot({
    ggplot(
      data = filter(sleeping.data, SepImprovesSexLife != ""),
      aes_string(x = factor("SepImprovesSexLife"), fill = "SepImprovesSexLife")) +
      geom_bar(width = 1) +
      ggtitle("\"Our sex life has improved as a result of sleeping in separate beds.\"") + 
      coord_polar("y") + 
      scale_fill_brewer(palette="Blues") +
      theme_minimal() + theme(
        axis.title = element_blank(),
        panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        legend.title = element_blank(),
        axis.text = element_blank())
  })

  # --------------------------------------------Pattern Analyzation-----------------------------------------------------------------

  # Data Frame alterations for Pattern Analyzation graph
  sleeping.data$HowOftenSleepingSeparate[sleeping.data$HowOftenSleepingSeparate == ""] <- 'No Response'

  # Reordering the levels (order) of the HowOftenSleepingSeparate and RelationshipStatus columns
  sleeping.data$HowOftenSleepingSeparate <- factor(sleeping.data$HowOftenSleepingSeparate,
                                                   levels = c("Every night",
                                                              "A few times per week",
                                                              "A few times per month",
                                                              "Once a month or less",
                                                              "Once a year or less",
                                                              "Never",
                                                              "No Response"))
  sleeping.data$RelationshipStatus <- factor(sleeping.data$RelationshipStatus,
                                                   levels = c("Single, but cohabiting with a significant other",
                                                              "In a domestic partnership or civil union",
                                                              "Married",
                                                              "Separated",
                                                              "Divorced",
                                                              "Widowed"))

  # Plotting code for Pattern Analyzation bar graph
  output$analyticsGraph <- renderPlot({
    ggplot(data = sleeping.data) + geom_bar(mapping = aes_string(x = input$analyticsVariable, fill = "HowOftenSleepingSeparate")) +
      ggtitle("") + labs(x = "Variable", y = "Count") + coord_flip() +
      theme(panel.background = element_rect(fill = 'grey')) +
      scale_fill_manual(values=c("#FF8C94", "#FFAAA6", "#FFD3B5", "#DCEDC2", "#A8E6CE", "#C4FAF8", "#ACE7FF"))
  })

  # --------------------------------------------Conclusion-----------------------------------------------------------------

})
