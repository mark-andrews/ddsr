library(shiny)
library(ggplot2)
library(gridExtra)
library(dplyr)
library(assertthat)

#################################################
zeros <- function(N, M){
  # Make a N*M matrix of zeros
  matrix(rep(0, N*M), c(N, M))
}

hypothesis.test <- function(H, alpha=0.05, power=0.8){
  # Test a null (H=0) or alternative (H=1) hypothesis
  # given specified Type 1 error rate, and statistical
  # power.

  if (H == 0){ # Null is true
    runif(1) <= alpha
  } else {
    runif(1) <= power
  }

}

index2matij <- function(index, N, M){

  # One dimensional indexing of a NxM matrix
  # Return row (i), col (j) indices of NxM matrix
  # that correspond to index.
  # You can more or less already do this in R by just
  # using "index" as your matrix index.

  f <- function(ind){

    assert_that(ind <= N*M)

    ind <- ind - 1

    i <- ind %/% M
    j <- ind - (i*M)

    cbind(i+1,j+1)
  }

  if (length(index) == 1) {
    f(index)
  } else {
    t(sapply(index, f))
  }

}


melt <- reshape::melt

# ggplot figure parameters
opt=theme(legend.position="none",
          panel.background = element_blank(),
          panel.grid = element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          axis.text =element_blank()
)

# Colours for the grids
light.square <- 'grey85'
dark.square <- 'grey35'
dot.colour <- '#E69F00'

#################################################

ui <- fluidPage(

  withMathJax(),
  titlePanel("Why Most Published Research Findings Are False"),
  fluidRow(
    column(3,
           helpText("Explore the influence of Type-1 error rate, and statistical power,
                     and prior probability that the hypothesis is true on
                    the rate of false positive effects. More precisely, this
                    demonstration shows us the probability that the null hypothesis
                    is true given that we have observed a significant result, and how this
                    varies as a function of Type 1 error rate, statistical power, and the
                    prior probability that the hypothesis is true.",
                    "This demonstration is based on examples in the paper by Ioannidis (2005)",
                    a("Why Most Published Research Findings Are False.",
                      href="http://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.0020124",
                      target="_blank"),
                    "All code for this demo can be found on",
                    a("GitHub.",
                      href="https://github.com/lawsofthought/replication-crisis-demos",
                      target='_blank')
                    ),
           sliderInput(inputId = "prior",
                       label = "Pr(H=True):",
                       min = 0.0,
                       max = 1.0,
                       value = 0.1),
           sliderInput(inputId = "alpha",
                       label = "Type I error rate:",
                       min = 0.0,
                       max = 0.1,
                       value = 0.05),
           sliderInput("power",
                       "Statistical Power:",
                       min = 0.0,
                       max = 1.0,
                       value = 0.8),
           htmlOutput("text")
    ),
    column(4,
           mainPanel(plotOutput(outputId="gridPlot")))
  )
)



server <- function(input, output) {

  output$gridPlot <- renderPlot({
    N <- 50
    M <- 50

    z <- zeros(N, M)

    I <- sample(seq(N*M), size = input$prior * N * M)

    z[I] <- 1
    z <- melt(z)
    z$significant <- sapply(z$value,
                            function(H) {hypothesis.test(H, input$alpha, input$power)})

    p0 <- ggplot(z, aes(x=X2, y=X1)) +
      geom_tile(aes(fill=factor(value)), colour='white') +
      scale_fill_manual(values = c(light.square, dark.square)) +
      opt +
      ggtitle('All hypotheses: Dark cells are True')

    p1 <- p0 +
      geom_point(aes(size=ifelse(significant, "dot", "no_dot")), colour=dot.colour, na.rm=TRUE) +
      scale_size_manual(values=c(dot=1.5, no_dot=NA), guide="none") +
      ggtitle('After testing: Dot indicates significance')


    s <- sort(filter(z, significant == T)$value)

    J <- length(s) %/% 30
    j <- 1 + length(s) %/% J
    m <- matrix(rep(NA, j*J), c(j, J))
    m[index2matij(seq(length(s)), j, J)] <- s

    p2 <- ggplot(melt(m), aes(x=X2, y=X1)) +
      geom_tile(aes(fill=factor(value)), colour='white') +
      scale_fill_manual(values = c(light.square, dark.square)) +
      opt +
      coord_fixed(ratio = 1/2) +
      ggtitle("Significant results: Light cells are false positives")

    output$html <- renderText({
      paste("You have selected", input$prior)
    })

    output$text <- renderUI({

    stmt.1 <- sprintf("Here, we will be testing %d hypotheses.
                      Each one is represented by a cell in the first (i.e. upper left) %d by %d grid to the right.
                      Of all the hypotheses, %d (%d%%) are true.
                      These are represented by dark cells.",
                        N*M,
                        N,
                        M,
                      as.integer(input$prior*N*M),
                      as.integer(100*input$prior))

    stmt.2 <- sprintf("We then test each hypothesis. If the hypothesis is not true, the probability that we obtain a
                      significant result is exactly equal to the Type 1 error rate. Here, this is %2.2f.
                      On the other hand, if the hypothesis is true, the probability of obtaining a significant
                      result is equal to the power of the test. Here, this is %2.2f.",
                      input$alpha,
                      input$power)

    stmt.3 <- sprintf("If the hypothesis yields a significant result, we indicate this by a dot in the second
                      (i.e. upper right) %d by %d grid to the right.
                      In this example, %d hypotheses (%d%%) are significant.",
                      N,
                      M,
                      length(s),
                      as.integer(100*length(s)/(N*M)))

    stmt.4 <- sprintf("In the bottom left grid, we show all of the %d significant results. There are %d false positives here.
                      These are represented by the light grey cells.
                        This is a false positive rate of %d%%.",
                       length(s),
                       sum(s),
                       as.integer(100*(1 - sum(s)/length(s))))

      HTML(paste(stmt.1, stmt.2, stmt.3, stmt.4, sep = '<br/>'))
    })

    grid.arrange(p0, p1, p2, nrow=2, ncol=2)

  }, height=800, width=800)
}


shinyApp(ui = ui, server = server)

