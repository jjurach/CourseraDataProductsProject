library(shiny)
library(ggmap)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  df_all <- read.csv('austin_restaurant_inspections.csv')
  df_all$idate <- as.Date(df_all$inspection_date,format = '%m/%d/%Y')
  
  prevZoom <- -1
  updateZoom <- function(newZoom) {
    if (prevZoom != newZoom) {
      fname <- paste("cache/map-", newZoom, ".rds", sep="")
      if (! file.exists(fname)) {
        map <- get_map(location = 'Austin, TX',
                       zoom=newZoom,
                       maptype="terrain-background")
        saveRDS(map, fname)
      } else {
        map <- readRDS(fname)
      }
      prevZoom <- newZoom
    }
    map
  }
  
  output$distPlot <- renderPlot({

    date1 <- as.Date(input$dateRange[1],'%Y-%m-%d')
    date2 <- as.Date(input$dateRange[2],'%Y-%m-%d')
    score1 <- input$score.range[1]
    score2 <- input$score.range[2]
    df <- df_all
    df <- df[(df$idate >= date1) & (df$idate <= date2),]
    df <- df[(df$score >= score1) & (df$score <= score2),]
    
    map <- updateZoom(input$zoom)
    g <- ggmap(map)
    point_alpha <- 0.2
    point_size <- 3
    if (input$zoom > 14 | score2 < 90) {
      point_alpha <- 0.6
      point_size <- 4
    }
    g <- g + geom_point(aes(lon, lat, tooltip=name), data=df, alpha=point_alpha, color=df$score, point_size=3)
    g <- g + labs(x=NULL, y=NULL)
    print(g)
  })
})