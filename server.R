library(shiny)
library(shinythemes)
library(plotly)
library(dplyr)
library(tidyverse)

server <- function(input, output) {
  
  output$chart1 <- renderPlotly({
    sleep_data <- read.csv("sleep75.csv");
    
    average_sleep_age <- sleep_data %>% 
      group_by(age) %>% 
      summarize(avg_sleep = mean(sleep))
    chart_1 <- ggplot(average_sleep_age, aes(x = age, y =  (avg_sleep/60)/7)) + 
      geom_line(color = "red") + 
      labs(title = "Correlation Between Age and Hours Slept Per Day",
           x = "Age",
           y = "Average Hours Slept Per Day")
    
    ggplotly(chart_1) %>%
      layout(
        xaxis = list(range = c(input$z_axis[1], input$z_axis[2]))
      )
    
  })
  
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
           x = "Experience",
           y = "Hours Worked Per Day" )
    
    ggplotly(chart_3) 
    
  })

}
