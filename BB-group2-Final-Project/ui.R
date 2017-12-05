library(shiny)

shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background"),
                   tabPanel("Graph"),
                   tabPanel("Graph", fluidPage( #mine
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
                  tabPanel("Graph"),
                   tabPanel("Graph", fluidPage(
                     titlePanel("Testing"))),
                  tabPanel("Intro"),
                    tabPanel("Background"),
                   tabPanel("Intro", fluidPage(
                              htmlOutput('Intro')
                            )
                   ),
                   tabPanel("Background",
                            titlePanel("Background Information"),
                            mainPanel()
                   ),
                    tabPanel("Graph"),
                    tabPanel("Graph"),
                    fluidPage(
                      p("These ")
                      # helps us stay together graph
                      # get better sleep graph
                      # improved sex life graph
                    ),
                    tabPanel("Pattern Analyzing" , fluidPage(
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
