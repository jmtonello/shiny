#
# This is the server logic of a Shiny web application. 
#
# k-means Clustering Examples
#

library(shiny)
library(ggplot2)

# Define server logic
shinyServer(function(input, output) {
  
  output$nText <- renderText(input$n)
  output$kText <- renderText(input$k)
  
  # generate n random points (x, y)
  points <- reactive({
    data.frame(x = runif(input$n), y = runif(input$n))
  })
  
  # compute k clusters 
  clusters <- reactive({
    kmeans(points(), centers = min(input$k, nrow(points())-1 ))
  })
    
  output$outputPlot <- renderPlot({
    validate(need(input$k < nrow(points()), "Please select less clusters than points!"))

    kObj <- clusters()
    
    # plot points colored by cluster
    g <- ggplot(points(), aes(x, y)) + 
        geom_point(color=kObj$cluster, size=3) + 
        theme(axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank()
          )
    
    # add centroids?
    if (input$showCenters) {
      centers <- data.frame(xCenter = kObj$centers[,1], yCenter=kObj$centers[,2])
      
      g <- g + geom_point(data = centers, 
                          aes(x=xCenter, y=yCenter), shape = 4, size=4, color=(1:input$k))
    }
    
    # show plot
    g

  })
})
