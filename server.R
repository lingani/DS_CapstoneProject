
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
devtools::install_github ("lingani/swiftcap")
library(swiftcap)
data(model)

shinyServer(function(input, output, clientData, session) {
  
  pred <- reactive({
    s <- paste(input$textfield)
    s <- paste(s, sep = ' ', collapse = ' ')
    predict (model, s)
  })
  
  output$predictions <- renderText({
    pre <- pred()
    s <- pre$word
    ss <- paste0 ("(", pre$rank, ")", pre$word)
    ss <- paste(ss, sep = ',    ', collapse = ' ')
  })
  
  output$phonePlot <- renderPlot({  
    pre <- pred()
    pre$word2 <- reorder(pre$word, pre$p)
    
    ggplot(pre, aes(x=word2, y=p)) +
      geom_bar(stat = "identity", position="stack") +
      coord_flip() +
      labs(title="The most likely next words and the probability of each as calculated by the model")

  
  })
  
})
