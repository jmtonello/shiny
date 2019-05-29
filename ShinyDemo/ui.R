#
# This is the user-interface definition of a Shiny web application. 
#
# k-means Clustering Example
#

library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("k-means Clustering Example"),
  
  # Sidebar with two slider inputs
  sidebarLayout(
    sidebarPanel(
       sliderInput("n",
                   "Number of points:",
                   min = 5,
                   max = 100,
                   value = 20),
       sliderInput("k",
                   "Number of clusters:",
                   min = 2,
                   max = 8,
                   value = 3),
       checkboxInput("showCenters", "Show/Hide centers")
    ),
    
    # Show a plot with clustered points
    mainPanel(
       plotOutput("outputPlot")
    )
  )
))
