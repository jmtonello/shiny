#
# This is the user-interface definition of a Shiny web application. 
#
# k-means Clustering Example
#

library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Clustering Example using k-means algorithm"),
  
  # Sidebar with two slider inputs
  sidebarLayout(
    sidebarPanel(
       sliderInput("n",
                   "How many random points should be generated?",
                   min = 5,
                   max = 100,
                   value = 20),
       sliderInput("k",
                   "Pick number of clusters:",
                   min = 2,
                   max = 8,
                   value = 3),
       checkboxInput("showCenters", "Show/Hide centers")
    ),
    
    # Show a plot with clustered points
    mainPanel(
       h3("Graph of random generated points"),
       plotOutput("outputPlot"),
       p("The application generated ", 
         textOutput("nText", inline = TRUE), 
          " random points and then divided them in ", 
         textOutput("kText", inline = TRUE), 
         " clusters using k-means algorithm.  Each point is colored according the cluster it belongs to."),
       p("You can show/hide the centroid of each cluster.")
    )
  )
))
