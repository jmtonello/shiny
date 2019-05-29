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
  
  output$outputPlot <- renderPlot({
    k <- input$k

    # compute k clusters
    kObj <- kmeans(points(), centers = k)
    centers <- data.frame(xCenter = kObj$centers[,1], yCenter=kObj$centers[,2])
    
    # plot points, clusters and centroids

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
    if (input$showCenters)
      g <- g + geom_point(data = centers, aes(x=xCenter, y=yCenter), shape = 4, size=4, color=(1:k))
    
    g

  })
})
