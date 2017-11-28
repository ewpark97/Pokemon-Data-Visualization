library(shiny)
library(scatterD3)

fluidPage(
  headerPanel("Pokemon Dataset"),
  
  sidebarPanel(
    textInput("pokemon_1", "Input 1st pokemon: ", 
              value = "Bulbasaur"),
    textInput("pokemon_2", "Input 2nd pokemon: ", 
              value = "Pikachu")),
  
  mainPanel(
    plotOutput("radarPlot", width = "600", height = "600")
  )
)