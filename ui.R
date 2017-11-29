suppressMessages(library(shiny))
library(radarchart)

fluidPage(
  titlePanel("Pokemon Match Up"),
  
  sidebarLayout(
    position = "right",
    sidebarPanel(
      textInput("pokemon_1", "Input 1st pokemon: ", 
                value = "Bulbasaur"),
      textInput("pokemon_2", "Input 2nd pokemon: ", 
                value = "Pikachu"),
      actionButton("go", "Enter"),
      h5(uiOutput('matchUp'))
    ),
    mainPanel(
      chartJSRadarOutput("radar", width = "600", height = "600"), width = 8
    )
  )
)