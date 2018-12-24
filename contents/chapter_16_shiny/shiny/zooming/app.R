library(shiny)
library(tidyverse)

theme_set(theme_classic())

swiss_df <- swiss %>% as_tibble(rownames = 'region') 

ui <- fluidPage(
  fluidRow(
    column(width = 8,
           plotOutput("scatterplot", height = 400, width = 800,
                      brush = brushOpts(
                        id = "selected_region"
                      )
           )
    ),
    column(width = 8,
           plotOutput("scattersubplot", height = 400, width = 800)
    )
  )
)

server <- function(input, output) {
  
  xyrange <- reactiveValues(x = NULL, y = NULL)
  
  output$scatterplot <- renderPlot({
    ggplot(swiss_df,
           aes(x = Examination, y = Fertility, label = region)) +
      geom_text()
  })
  
  output$scattersubplot <- renderPlot({
    ggplot(swiss_df,
           aes(x = Examination, y = Fertility, label = region)) +
      geom_text() +
      coord_cartesian(xlim = xyrange$x, ylim = xyrange$y)
  })
  
  observe({
    sel_reg <- input$selected_region
    xyrange$x <- c(sel_reg$xmin, sel_reg$xmax)
    xyrange$y <- c(sel_reg$ymin, sel_reg$ymax)
  })
  
}

shinyApp(ui, server)