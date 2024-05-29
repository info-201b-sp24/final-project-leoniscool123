library(shiny)
library(shinythemes)
library(plotly)

server <- function(input, output) {
  output$scatterPlot <- renderPlotly({
    sleep_data <- read.csv("sleep75.csv");
    chart_2_plt <- ggplot(sleep_data, aes(x = sleep, y = lhrwage)) + 
      geom_point(alpha = 0.7) + 
      labs(title = "Natural Logarithm of Hourly Wage vs Sleep",
           x = "Sleep in Minutes",
           y = "Natural Logarithmic Wage",
           color = "Health")
    
    
    ggplotly(chart_2_plt) %>%
      layout(
        xaxis = list(range = c(input$x_axis[1], input$x_axis[2])),
        yaxis = list(range = c(input$y_axis[1], input$y_axis[2]))
      )
  })
}
