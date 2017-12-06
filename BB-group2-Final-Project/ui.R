library(shiny)

shinyUI(navbarPage("Sleeping Alone",
                   
                   tabPanel("Introduction", fluidPage(
                     htmlOutput('Intro')
                   )),
                    tabPanel("Background", fluidPage(
                      titlePanel("Statistics on the Data"),
                      sidebarLayout(
                        sidebarPanel(
                          # dataVariable Widget
                          selectInput('dataVariable', "Variable:",
                                      list("Years Together" = "CurrentRelationshipLength",
                                           "Education" = "Education",
                                           "Income" = "HouseholdIncome"))
                          ),
                        # Main Panel
                        mainPanel(
                          plotOutput("backgroundGraph")
                        )
                      ))
                    ),
                   tabPanel("Graph"),
                   tabPanel("Graph", fluidPage( #mine
                     titlePanel("Participant Opinions on Sleeping Separately"),
                     h5("Participants were asked to choose from a range of \"Strongly Agree\" to \"Strongly Disagree\" to the
                       following statements:"),
                     p("- \"Sleeping in separate beds helps us to stay together.\""),
                     p("- \"We sleep better when we sleep in separate beds.\""),
                     p("- \"Our sex life has improved as a result of sleeping in separate beds.\""),
                     # helps us stay together graph
                     plotOutput('stayTogetherPie'),
                     # get better sleep graph
                     plotOutput('betterSleepPie'),
                     # improved sex life graph
                     plotOutput('improvedSexPie')
                     )
                  ),
                  tabPanel("Pattern Analyzation" , fluidPage(
                    titlePanel("How Different Variables Affect Frequency of Sleeping Alone"),
                      sidebarLayout(
                        sidebarPanel(
                          # Color Widget
                          radioButtons('color', "Color by:",
                                      c("Education" = "",
                                        "Gender" = "",
                                        "Marital Status" = "")),
                          # Variable Widget
                          selectInput('variable', "Variable:",
                                     list("Income" = "",
                                          "Age" = "",
                                          "Time Together" = ""))
                          ),
                        # Main Panel, Render the Graph
                        mainPanel(
                          plotOutput("analyticsGraph")
                        )
                   ))),
                   tabPanel("Conclusion", fluidPage( #mine
                     #conclusion statements here
                   ))
))
