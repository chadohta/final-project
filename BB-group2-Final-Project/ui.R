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

                   tabPanel("Reasons", fluidPage(
                     titlePanel("Reasons for Sleeping Alone"),
                     p("Partipants were asked to choose the reasons they would sleep alone. These are the results:"),
                     mainPanel(
                       plotOutput("graph1Bar")
                     )
                    )
                   ),
# --------------------------------------------Graph Tab 2-----------------------------------------------------------------

                   tabPanel("Opinions on Sleeping Separately", fluidPage(
                     titlePanel("Participant Opinions on Sleeping Separately"),
                     
                     # allows users to choose what topic they would like to see in pie chart form
                     sidebarPanel(
                       selectInput('graph2Input', "Topic:",
                                   list("Helping Relationships" = "SepHelpsUsStayTogether",
                                        "Better Sleep" = "SepHelpsMeSleepBetter",
                                        "Better Sex" = "SepImprovesSexLife"))
                     ),
                     
                     # explanation to users
                     p("Participants were asked to choose from a range of \"Strongly Agree\" to \"Strongly Disagree\" to the
                       following statements:"),
                     p("- \"Sleeping in separate beds helps us to stay together.\""),
                     p("- \"We sleep better when we sleep in separate beds.\""),
                     p("- \"Our sex life has improved as a result of sleeping in separate beds.\""),
                     
                     # displays the pie chart
                     plotOutput('graph2Pie')
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
                     includeMarkdown("Conclusion.Rmd")
                   ))
))
