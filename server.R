library(radarchart)
library(tidyr)
library(scatterD3)
suppressMessages(library(dplyr))
suppressMessages(library(shiny))

ds <- read.csv('Pokemon.csv')

colnames(ds) <- c('ID', 'Name', 'Type 1', 'Type 2', 'Total', 
                  'HP', 'Attack', 'Defense', 'Attack Speed',
                  'Defense Speed', 'Speed', 'Generation', 
                  'Legendary')

dsTop15 <- filter(ds, ds$Total > 680)



function(input, output) {
  radarData <- reactive({
    input$go
    
    pokemon_1_name <- paste0(toupper(substr(isolate(input$pokemon_1), 1, 1)), 
                             tolower(substring(isolate(input$pokemon_1), 2)))
    pokemon_2_name <- paste0(toupper(substr(isolate(input$pokemon_2), 1, 1)), 
                             tolower(substring(isolate(input$pokemon_2), 2)))
    pokemon_1 <- filter(ds, Name == pokemon_1_name)
    pokemon_2 <- filter(ds, Name == pokemon_2_name)
    
    df <- rbind(pokemon_1, pokemon_2)
  })
  
  output$matchUp <- renderText({
    if (nrow(radarData()) >= 2) {
      if (radarData()[1, 'Total'] > radarData()[2, 'Total']) {
        paste('Based on total stats:', radarData()[1, 'Name'], 'wins!')
      } else if (radarData()[1, 'Total'] < radarData()[2, 'Total']) {
        paste('Based on total stats:',radarData()[2, 'Name'], 'wins!')
      } else {
        paste("Based on total stats: It's a draw!")
      }
    }
  })
  
  topData <- reactive({
    ds %>%
      arrange(desc(Total)) %>%
      head(n = input$top_obs)
  })
  
  output$topRadar <- renderChartJSRadar({
    ds <- topData()
    maxVal <- max(ds[, 6:11])
    radarDF <- ds %>% select(Name, 6:11) %>% as.data.frame()
    radarDF <- gather(radarDF, key=Label, value=Score, -Name) %>%
      spread(key=Name, value=Score)
    chartJSRadar(radarDF, maxScale = maxVal, showToolTipLabel=TRUE,
                 showLegend = FALSE, polyAlpha = 0.15, lineAlpha = 0.1)
  })
  
  output$x_axis <- renderUI({
    selectInput("x", "x variable:",
                choices=c(colnames(ds[5:12])),
                selected = "HP")
  })
  
  output$y_axis <- renderUI({
    selectInput("y", "y variable:", 
                choices=c(colnames(ds[5:12])),
                selected = "Attack")
  })
  
  output$color <- renderUI({
    selectInput("color", "color:", 
                choices=c(colnames(ds[3:13])),
                selected = "Type 2")
  })
  
  data <- reactive({
    ds[1:input$obs,]
  })
  
  output$stats <- renderScatterD3({
    scatterD3(x = data()[,input$x], 
              y = data()[,input$y], 
              lab = data()[,'Name'],
              xlab = input$x,
              ylab = input$y,
              col_var = data()[,input$color], 
              col_lab = input$color,
              symbol_var = data()[,'Type 1'],
              symbol_lab = 'Type 1',
              point_opacity = input$pointAlpha,
              point_size = input$pointSize,
              labels_size = input$labelSize,
              transitions = input$transitions
    )
  })
}

