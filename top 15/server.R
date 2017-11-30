library(radarchart)
library(tidyr)
library(scatterD3)
suppressMessages(library(dplyr))
suppressMessages(library(shiny))



ds <- read.csv('Pokemon.csv')
dsTop15 <- filter(ds, ds$Total >680)




function(input, output){
  radarData <- reactive({
    input$go

  output$radar <- renderChartJSRadar({
    dsTop15 <- radarData()
    
    maxVal <- max(dsTop15[, 6:11])
    
    Top15radarDF <- dsTop15 %>% select(Name, 6:11) %>% as.data.frame()
    
    Top15radarDF <- gather(Top15radarDF, key=Label, value=Score, -Name) %>%
      spread(key=Name, value=Score)
    
    chartJSRadar(Top15radarDF, maxScale = maxVal, showToolTipLabel = TRUE)
  })
  })
}

