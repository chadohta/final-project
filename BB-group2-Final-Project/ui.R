
library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background"),
                   tabPanel("Graph"),
                   tabPanel("Graph"),
                   tabPanel("Graph", fluidPage(
                                      titlePanel("Testing"))),
                   tabPanel("Conclusion")
))