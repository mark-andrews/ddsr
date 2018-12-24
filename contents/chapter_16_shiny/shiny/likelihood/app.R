library(shiny)
library(ggplot2)

likelihood <- function(x, N, n){
  x^n * (1-x)^(N-n)
}

find.roots <- function(n, N, z=1/4) {
  
  f <- function(x, N, n, z) {
    standardized.likelihood <- likelihood(x, N, n) / likelihood(n/N, N, n)
    standardized.likelihood - z
  }
  
  left.root <- uniroot(f, 
                       c(0, n/N), 
                       tol = 0.0001, 
                       N = N, 
                       n=n,
                       z=z)
  
  right.root <- uniroot(f, 
                        c(n/N, 1), 
                        tol = 0.0001, 
                        N = N, 
                        n=n,
                        z=z)
  
  list(x = left.root$root,
       y = likelihood(left.root$root, N, n),
       xend = right.root$root,
       yend = likelihood(right.root$root, N, n))
}


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  withMathJax(),
  
  # Application title
  titlePanel("Likelihood function of a coin's bias"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      helpText("Calculate the likelihood function of the bias on a coin, 
                conditioned on having observed the outcomes of a sequence of flips of this coin. 
               Use the controls to specify the total number of coin flips, 
               and the total number of times a Heads is the observed outcome. 
               Check boxes to choose which likelihood intervals to draw. 
               The likelihood interval gives the set of values of the bias whose likelihoods are within the specified factor
               of the maximum likelihood value.",
               "All source code for this demo can be found on",
               a("GitHub.",
                 href="https://github.com/lawsofthought/psypag-kent-2017",
                 target='_blank')),
      sliderInput("N",
                  "Number of coin flips:",
                  min = 1,
                  max = 250,
                  value = 130, 
                  step = 1),
      uiOutput("n.obs.slider"),
      radioButtons("likelihood.interval", 
                   label="Likelihood interval:",
                   choices=c("\\(\\tfrac{1}{2}\\)" = "1",
                     "\\(\\tfrac{1}{4}\\)" = "2",
                     "\\(\\tfrac{1}{8}\\)" = "3",
                     "\\(\\tfrac{1}{16}\\)" = "4",
                     "\\(\\tfrac{1}{32}\\)" = "5"),
                   selected="5"),
      htmlOutput("text")
      ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot", width="100%")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  output$n.obs.slider <- renderUI({
    sliderInput("n.obs", 
                "Observed number of Heads: ", 
                min=0, 
                max=input$N, 
                step=1,
                value=max(1, 0.4*input$N))
  })
  
  output$distPlot <- renderPlot({
    
    withMathJax()
    
    expected.value <- input$N*input$theta

    if (is.null(input$n.obs)){
      n.obs <- max(1, 0.4*input$N)
    } else {
      n.obs <- input$n.obs
    }
    
    theta <- seq(0, 1, by = 0.001)
    ll <- likelihood(theta, input$N, n.obs)
    
    mle <- n.obs/input$N

    Df <- data.frame(theta,
                     ll = choose(input$N, n.obs) * ll)
    
  
    
    likelihood.interval <- switch(input$likelihood.interval,
                                  "1" = 1/2,
                                  "2" = 1/4,
                                  "3" = 1/8,
                                  "4" = 1/16,
                                  "5" = 1/32)
    
    roots <- find.roots(n.obs, input$N, likelihood.interval)

    ggplot(Df,
           mapping=aes(x = theta, y = ll)) + 
      geom_line() +
      theme_classic() + 
      xlab('theta') +
      ylab('P(theta)') +
      geom_segment(aes(x = roots$x,
                       y = roots$y * choose(input$N, n.obs),
                       xend = roots$xend,
                       yend = roots$yend * choose(input$N, n.obs)),
                       col='red')
    
  }, height = 600, width = 800)
}

# Run the application 
shinyApp(ui = ui, server = server)