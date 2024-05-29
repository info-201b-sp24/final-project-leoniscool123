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
  
  output$chart3 <- renderPlotly({
    sleep_data <- read.csv("sleep75.csv");
    
    gender_input <- substring(input$gender , 1,1)
    age_bound <- input$age_slider[1]
    sleep_hours <- input$hours_slept[1]
    # age_max_bound <- input$age_slider[2]
    
    
    average_sleep_expr <- sleep_data %>% 
      group_by(exper) %>% 
      filter(male == gender_input) %>% 
      filter(age > age_bound ) %>% 
      summarize(avg_totwrk = mean(totwrk), na.rm = TRUE)
    
    
    
    
    chart_3 <- ggplot(average_sleep_expr, aes(x = exper, y =   avg_totwrk/60/5)) + 
      geom_line(color = "blue") + 
      labs(title = "Correlation between Exeperience and Hours Worked Per Day",
           x = "Experiece",
           y = "Hours Worked Per Day" )
    
    ggplotly(chart_3) 
    
  })

}
