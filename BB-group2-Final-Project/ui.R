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
                     p("- \"Our sex life has improved as a result of sleeping in separate beds.\"")
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