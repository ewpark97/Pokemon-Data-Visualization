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
                 sliderInput("obs", "number of observations:",
                             value = c(1,10), min = 1, max = 800,
                             step = 1),
                 uiOutput("x_axis"),
                 uiOutput("y_axis"),
                 uiOutput("color"),
                 sliderInput("pointSize", "point size:",
                             value = 50, min = 0, max = 100,
                             step = 0.1),
                 sliderInput("pointAlpha", "alpha:",
                             value = 0.7, min = 0, max = 1,
                             step = 0.1),
                 sliderInput("labelSize", "label size:",
                             value = 11, min = 0, max = 25,
                             step = 1),
                 checkboxInput("transitions", "use transitions:", 
                               value = TRUE)
               ),
               
               mainPanel(
                 scatterD3Output("stats", height = "600px")
               )
             )
    ), 
    
    tabPanel("About",
             tags$h1(
               "Pokemon Stats Exploration"
             ),
             
             tags$h2(
               "The Project"
             ),
             
             tags$div(
               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                   Integer nec odio. Praesent libero. Sed cursus ante dapibus 
               diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. 
               Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed 
               augue semper porta. Mauris massa. Vestibulum lacinia arcu 
               eget nulla. Class aptent taciti sociosqu ad litora torquent 
               per conubia nostra, per inceptos himenaeos. Curabitur 
               sodales ligula in libero."
             ),
             
             tags$h2(
               "The Data"
             ),
             
             tags$div(
               "Data Source:",
               tags$a(
                 "https://www.kaggle.com/abcsds/pokemon"
               )
             ),
             
             tags$h2(
               "Contributions"
             ),
             
             tags$ul(
               tags$li(
                 tags$b("Eric S Shin"),
                 tags$p(
                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                   Integer nec odio. Praesent libero. Sed cursus ante dapibus 
                   diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. 
                   Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed 
                   augue semper porta. Mauris massa. Vestibulum lacinia arcu 
                   eget nulla. Class aptent taciti sociosqu ad litora torquent 
                   per conubia nostra, per inceptos himenaeos. Curabitur 
                   sodales ligula in libero."
                 )
               ),
               
               tags$li(
                 tags$b("Eun Won Park"),
                 tags$p(
                   "Class aptent taciti sociosqu ad litora torquent per conubia 
                   nostra, per inceptos himenaeos. Curabitur sodales ligula in 
                   libero. Sed dignissim lacinia nunc. Curabitur tortor. 
                   Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. 
                   Maecenas mattis. Sed convallis tristique sem. Proin ut 
                   ligula vel nunc egestas porttitor. Morbi lectus risus, 
                   iaculis vel, suscipit quis, luctus non, massa. Fusce ac 
                   turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus 
                   metus, ullamcorper vel, tincidunt sed, euismod in, nibh. "
                 )
               ),
               
               tags$li(
                 tags$b("Frank Ge"),
                 tags$p(
                   "Quisque volutpat condimentum velit. Class aptent taciti 
                   sociosqu ad litora torquent per conubia nostra, per inceptos 
                   himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt 
                   mattis, tortor neque adipiscing diam, a cursus ipsum ante quis 
                   turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. 
                   Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. 
                   Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus 
                   suscipit. "
                 )
               ),
               
               tags$li(
                 tags$b("Gilbert Febrianto"),
                 tags$p(
                   "Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, 
                   metus vitae pharetra auctor, sem massa mattis sem, at interdum 
                   magna augue eget diam. Vestibulum ante ipsum primis in faucibus 
                   orci luctus et ultrices posuere cubilia Curae; Morbi lacinia 
                   molestie dui. Praesent blandit dolor. Sed non quam. In vel mi sit 
                   amet augue congue elementum. Morbi in ipsum sit amet pede 
                   facilisis laoreet. Donec lacus nunc, viverra nec, blandit vel, 
                   egestas et, augue. Vestibulum tincidunt malesuada tellus. Ut 
                   ultrices ultrices enim. Curabitur sit amet mauris. Morbi in dui 
                   quis est pulvinar ullamcorper. "
                 )
               )
               
             )
             
    )
  )
)