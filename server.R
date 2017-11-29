library(radarchart)
library(tidyr)
suppressMessages(library(dplyr))
suppressMessages(library(shiny))

ds <- read.csv('Pokemon.csv')

colnames(ds) <- c('ID', 'Name', 'Type 1', 'Type 2', 'Total', 
                  'HP', 'Attack', 'Defense', 'Attack Speed',
                  'Defense Speed', 'Speed', 'Generation', 
                  'Legendary')

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
  
  output$radar <- renderChartJSRadar({
    ds <- radarData()
    
    maxVal <- max(ds[, 6:11])
    
    radarDF <- ds %>% select(Name, 6:11) %>% as.data.frame()
    
    radarDF <- gather(radarDF, key=Label, value=Score, -Name) %>%
      spread(key=Name, value=Score)
    chartJSRadar(radarDF, maxScale = maxVal, showToolTipLabel=TRUE, main = ifelse(nrow(radarData()) >= 2,
                                                                               paste(radarData()[1,'Name'], 'vs.', 
                                                                                     radarData()[2,'Name']), paste('')))
  })
}

