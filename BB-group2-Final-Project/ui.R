library(shiny)

shinyUI(navbarPage("Sleeping Alone",
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
