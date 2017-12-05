library(shiny)

shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background"),
                   tabPanel("Graph"),
                   tabPanel("Graph", fluidPage( #mine
                     p("These ")
                     # helps us stay together graph
                     # get better sleep graph
                     # improved sex life graph
                     )),
                   tabPanel("Graph"),
                   tabPanel("Graph", fluidPage(
                     titlePanel("Testing"))),
                   tabPanel("Conclusion", fluidPage( #mine
                     #conclusion statements here
                   ))
))