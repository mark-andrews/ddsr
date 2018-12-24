library(shiny)

ui <- fluidPage(
  fluidRow(
    column(width = 10, 
           align="center",
           plotOutput("scatterplot", 
                      height = 300, 
                      width = 400,
                      brush = brushOpts(id = "selected_region")))
  ),
  fluidRow(
    column(width = 10,
           h4("Selected points"),
           verbatimTextOutput("selected_region_info")
    )
  )
)

server <- function(input, output){
  
  output$scatterplot <- renderPlot({
    ggplot(swiss, aes(x = Examination, y = Fertility)) +
      geom_point() +
      theme_classic()
  })

  output$selected_region_info <- renderPrint({
    brushedPoints(swiss, input$selected_region)
  })
}

shinyApp(ui = ui, server = server)

