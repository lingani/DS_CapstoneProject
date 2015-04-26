
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyUI(
  fluidPage(

    # Application title
    titlePanel("Type Ahead Prediction"),

      div(class="row-fluid ",
        div(class="well container-fluid"   ,  
            textInput(inputId="textfield", label="type some text in the box bellow", value = ""), 
            tags$head(tags$style(type="text/css", "#textfield {width: 100%}")),
            
            hr(),
            
            h4("predictions"),
            textOutput("predictions")
        )
     ),

    hr(),
    
    fluidRow(
      column(6,
             h4("Top suggestions"),
             plotOutput("phonePlot") 
      ),

      column(6,
             h4("About the App"),
             p("This application is intended to work as a Type ahead prediction like swiftkey"),
             p("This application is le capstone project as part of the JHU Data Science Specialization offered through Coursera"),
             h5(strong("How it works?")),
             p("You actually need to inter text in the text input field above to get the predictions just bellow. 
               The most likely next word comes firt. we have choosen to show the top 5 suggestions if there are based on
               the model. Indeed you can type any text out of the suggestion. At the left side, we just show a reactive barplot of the top suggestions as the user inter text."),
             h5(strong("what is next?")),
             p("The next step is to use javascript to provide user friendly type ahead."),
             h5(strong("Where is the code...?")),
             p("You can find the source code on my github and a slide deck on Rpubs presenting the app in detrails")
             
      )
    )
  )
)