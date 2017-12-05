<<<<<<< HEAD
=======

>>>>>>> 6ca1b3d3d911fb4499f96628c4add6ab5cbad6c0
library(shiny)

shinyUI(navbarPage("Sleeping Alone",
                   tabPanel("Intro"),
                   tabPanel("Background"),
                   tabPanel("Graph"),
                   tabPanel("Graph"),
<<<<<<< HEAD
                   fluidPage(
                     p("These ")
                     # helps us stay together graph
                     # get better sleep graph
                     # improved sex life graph
                   ),
                   tabPanel("Graph"),
=======
                   tabPanel("Graph", fluidPage(
                                      titlePanel("Testing"))),
>>>>>>> 6ca1b3d3d911fb4499f96628c4add6ab5cbad6c0
                   tabPanel("Conclusion"),
                   fluidPage(
                     p("insert paragraph here")
                   )
))