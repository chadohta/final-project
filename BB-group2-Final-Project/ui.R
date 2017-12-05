#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background", 
                            titlePanel("Background Information")),
                   tabPanel("Graph"),
                   fluidPage(
                     
                   ),
                   tabPanel("Graph"),
                   tabPanel("Conclusion"),
                   fluidPage(
                     p("insert paragraph here")
                   )
))