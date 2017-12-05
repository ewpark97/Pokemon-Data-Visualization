suppressMessages(library(shiny))
library(scatterD3)
library(radarchart)


fluidPage(
  navbarPage("Pokemon Dataset",
    tabPanel("Pokemon Match Up",
      sidebarLayout(
        position = "right",
        sidebarPanel(
          textInput("pokemon_1", "1st Pokemon: ", 
                    value = "Bulbasaur"),
          textInput("pokemon_2", "2nd Pokemon: ", 
                    value = "Pikachu"),
          actionButton("go", "Enter"),
          h5(uiOutput('matchUp'))
        ),
        mainPanel(
          chartJSRadarOutput("radar", width = "600", height = "600"), width = 8
        )
      )
    ),
    
    tabPanel("Top Stats Distribution",
             sidebarLayout(
               sidebarPanel(
                 sliderInput("top_obs", "Quantity Range:",
                             value = 1, min = 1, max = 800,
                             step = 1)
               ),
               
               mainPanel(
                 chartJSRadarOutput("topRadar", width = "600", height = "600")
               )
             )
    ),
            
    tabPanel("Stats vs. Stats",
             sidebarLayout(
               sidebarPanel(
                 sliderInput("obs", "Number of Observations:",
                             value = c(1,10), min = 1, max = 800,
                             step = 1),
                 uiOutput("x_axis"),
                 uiOutput("y_axis"),
                 uiOutput("color"),
                 sliderInput("pointSize", "Point Size:",
                             value = 50, min = 0, max = 100,
                             step = 0.1),
                 sliderInput("pointAlpha", "Alpha:",
                             value = 0.7, min = 0, max = 1,
                             step = 0.1),
                 sliderInput("labelSize", "Label Size:",
                             value = 11, min = 0, max = 25,
                             step = 1),
                 checkboxInput("transitions", "Use Transitions:", 
                               value = TRUE)
               ),
               
               mainPanel(
                 scatterD3Output("stats", height = "600px")
               )
             )
    ), 
    
    tabPanel("About The Project",
             includeMarkdown("about.Rmd"))
  )
)