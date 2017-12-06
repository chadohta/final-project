library(shiny)

shinyUI(navbarPage("Sleeping Alone",
# --------------------------------------------Introduction-----------------------------------------------------------------
                   
                   tabPanel("Intro", fluidPage(
                     includeMarkdown("Intro.Rmd")
                   )),
# --------------------------------------------Background Information-------------------------------------------------------

                    tabPanel("Background", fluidPage(
                      titlePanel("Data Statistics"),
                      sidebarLayout(
                        sidebarPanel(
                          # dataVariable Widget
                          selectInput('dataVariable', "Histogram Variable:",
                                      list("Years Together" = "CurrentRelationshipLength",
                                           "Education" = "Education",
                                           "Income" = "HouseholdIncome")),
                          # Age or Gender Widget
                          selectInput('ageOrGender', "Pie Chart Variable:",
                                      list("Gender" = "Gender",
                                           "Age" = "Age"))
                          ),
                        # Main Panel
                        mainPanel(
                          plotOutput("backgroundGraph"),
                          plotOutput("backgroundPie")
                        )
                      ))
                    ),
# --------------------------------------------Graph Tab 1-----------------------------------------------------------------

                   tabPanel("Graph", fluidPage(
                     titlePanel("Sleep Trends"),
                     p("Partipants were asked to choose the reasons they would sleep alone. These are the results:"),
                     mainPanel(
                       plotOutput("graph1Bar")
                     )
                    )
                   ),
# --------------------------------------------Graph Tab 2-----------------------------------------------------------------

                   tabPanel("Graph", fluidPage(
                     titlePanel("Participant Opinions on Sleeping Separately"),
                     p("Participants were asked to choose from a range of \"Strongly Agree\" to \"Strongly Disagree\" to the
                       following statements:"),
                     p("- \"Sleeping in separate beds helps us to stay together.\""),
                     p("- \"We sleep better when we sleep in separate beds.\""),
                     p("- \"Our sex life has improved as a result of sleeping in separate beds.\""),
                     plotOutput('stayTogetherPie'),
                     plotOutput('betterSleepPie'),
                     plotOutput('improvedSexPie')
                  )),
# --------------------------------------------Pattern Analyzation-----------------------------------------------------------------

                  tabPanel("Pattern Analyzation" , fluidPage(
                    titlePanel("How Different Variables Potentially Affect Frequency of Sleeping Alone"),
                      sidebarLayout(
                        sidebarPanel(
                          # Variable Widget
                          selectInput('analyticsVariable', "Variable:",
                                     list("Income" = "HouseholdIncome",
                                          "Age" = "Age",
                                          "Education" = "Education",
                                          "Gender" = "Gender",
                                          "Relationship Status" = "RelationshipStatus",
                                          "Time Together" = "CurrentRelationshipLength"))
                          ),
                        # Main Panel, Render the Graph
                        mainPanel(
                          plotOutput("analyticsGraph")
                        )
                   ))),
# --------------------------------------------Conclusion-----------------------------------------------------------------

                   tabPanel("Conclusion", fluidPage(
                     #conclusion statements here
                   ))
))
