
library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background", 
                            titlePanel("Background Information")),
                   tabPanel("Graph"),
                   tabPanel("Graph", fluidPage(
                                      titlePanel("Testing"))),
                   tabPanel("Conclusion"),
                   fluidPage(
                     p("insert paragraph here")
                   )
))