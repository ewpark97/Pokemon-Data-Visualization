library(shiny)
library(scatterD3)
library(radarchart)


fluidPage(
  navbarPage("Pokemon Dataset",
             tabPanel("Pokemon",
                      sidebarLayout(
                        position = "right",
                        sidebarPanel(
                          selectInput("Name", "Top 15 Pokemons:", dsTop15$Name)
                        ),
                        mainPanel(
                          chartJSRadarOutput("radar", width = "600", height = "600"), width = 8
                        )
                      )
             )
  )
)
