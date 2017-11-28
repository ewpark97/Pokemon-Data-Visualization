library(fmsb)
library(dplyr)
library(shiny)

setwd('~/Desktop/INFO 201/pokemon/')
ds <- read.csv('data/Pokemon.csv')

colnames(ds) <- c('ID', 'Name', 'Type 1', 'Type 2', 'Total', 
                  'HP', 'Attack', 'Defense', 'Attack Speed',
                  'Defense Speed', 'Speed', 'Generation', 
                  'Legendary')

function(input, output) {
  output$radarPlot <- renderPlot({
    pokemon_1 <- filter(ds, Name == paste0(toupper(substr(input$pokemon_1, 1, 1)), 
                                           tolower(substring(input$pokemon_1, 2))))
    pokemon_2 <- filter(ds, Name == paste0(toupper(substr(input$pokemon_2, 1, 1)), 
                                           tolower(substring(input$pokemon_2, 2))))
    
    df <- rbind(pokemon_1, pokemon_2)
    
    colors_border <- c(rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9))
    colors_fill <- c(rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4))
    
    radarchart(rbind(rep(max(df[, 6:11]), 6), rep(0, 6), 
                     df[, 6:11]),
               title = paste(df[1,'Name'], 'vs.', df[2,'Name']),
               axistype = 1,
               pcol = colors_border, 
               pfcol = colors_fill, 
               plwd = 4, 
               plty = 1,
               cglcol = "grey", 
               cglty = 3, 
               axislabcol = "grey", 
               caxislabels = seq(0, max(df[, 6:11]),
                                 max(df[, 6:11])/4), 
               cglwd = 1.2,
               vlcex = 1.2)
    
    legend(x = 0.5, 
           y = 1, 
           legend = df[,'Name'], 
           bty = 'n',
           pch = 20, 
           col = colors_fill, 
           text.col = colors_border, 
           cex = 1.2, 
           pt.cex = 3
    )
  })
}