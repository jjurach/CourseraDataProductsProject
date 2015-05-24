library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Austin Restuarant Inspections"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(width=4,

      sliderInput("score.range",
                  "Score Range:",
                  min = 40,
                  max = 100,
                  value = c(80,95)
      ),

      sliderInput("zoom",
                  "Zoom:",
                  min = 10,
                  max = 17,
                  value = 12
      ),
    
      dateRangeInput("dateRange",
                     label = "Date Range:",
                     start = Sys.Date()-365,
                     end = Sys.Date(),
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      h1("Getting Started"),
      p("In order to get started, modify any of the inputs in order to see changes in the map."),
      p(strong("Score Range")," selects which scores are seen on the map."),
      p(strong("Zoom")," controls how zoomed in you are on 'Austin, TX'."),
      p(strong("Date Range")," selects on the inspection_date of the dataset.")
    ),
  )
))