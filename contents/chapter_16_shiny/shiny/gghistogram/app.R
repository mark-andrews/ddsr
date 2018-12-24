library(shiny)
library(tidyverse)

houseprices_df <- read_csv("housing.csv")

ui <- fluidPage(
    titlePanel("Histogram of house prices (Canadian dollars)."),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("binwidth",
                        "Width of bins (Canadian dollars):",
                        min = 1000,
                        max = 12000,
                        step = 1000,
                        value = 5000),
            width = 4
        ),
        mainPanel(
           plotOutput("houseprices_hist"),
           width = 8
        )
    )
)

server <- function(input, output) {

    output$houseprices_hist <- renderPlot({

      ggplot(houseprices_df, aes(x = price)) +
        geom_histogram(binwidth = input$binwidth, colour = 'white') +
        theme_classic() 
      
    })
    
}

shinyApp(ui = ui, server = server)
