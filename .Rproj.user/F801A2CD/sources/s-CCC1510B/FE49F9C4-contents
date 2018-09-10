library(Rcpp)
library(ggplot2)
library(dplyr)
library(shiny)

opt = theme(legend.position  = "none",
            panel.background = element_rect(fill="white"),
            axis.ticks       = element_blank(),
            panel.grid       = element_blank(),
            axis.title       = element_blank(),
            axis.text        = element_blank())

cppFunction('DataFrame createTrajectory(int n, double x0, double y0, 
            double a, double b, double c, double d) {
            // create the columns
            NumericVector x(n);
            NumericVector y(n);
            x[0]=x0;
            y[0]=y0;
            for(int i = 1; i < n; ++i) {
            x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
            y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
            }
            // return a new data frame
            return DataFrame::create(_["x"]= x, _["y"]= y);
            }
            ')


# ui section
ui = fluidPage(
  
  #  Title
  titlePanel("Clifford Attractor"),
  
  # Sidebar with slider and controls for animation
  sidebarLayout(
    
    # sidebar with slider
    sidebarPanel(
      
      sliderInput(inputId = "a", label = "a", min = -2, max = 2, value = 0, step = 0.05),
      sliderInput(inputId = "b", label = "b", min = -2, max = 2, value = 0, step = 0.05),
      sliderInput(inputId = "c", label = "c", min = -2, max = 2, value = 0, step = 0.05),
      sliderInput(inputId = "d", label = "d", min = -2, max = 2, value = 0, step = 0.05),
      
      actionButton(inputId = "create", "Create Plot")
    ),
    
    # Show the animated graph
    mainPanel(
      plotOutput(outputId = "plot1")
    )
  )
)



# server section
server = function(input, output, session) {
  
  createdf <- eventReactive(input$create, {
    
    df <- createTrajectory(1000000, 0, 0, input$a, input$b, input$c, input$d)
    df
    
  })
  
  # Show the graph
  output$plot1 <- renderPlot({

    p <- ggplot(createdf(), aes(x, y)) + 
      geom_point(color = "black", shape = 46, alpha = 0.5) + 
      opt
    p
    
  })
}

shinyApp(ui, server)
