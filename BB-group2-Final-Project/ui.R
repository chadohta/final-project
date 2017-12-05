library(shiny)

shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background"),
                   tabPanel("Graph"),
                   tabPanel("Graph"),
                   fluidPage(
                     p("These ")
                     # helps us stay together graph
                     # get better sleep graph
                     # improved sex life graph
                   ),
                   tabPanel("Graph"),
                   tabPanel("Conclusion"),
                   fluidPage(
                     p("insert paragraph here")
                   )
))