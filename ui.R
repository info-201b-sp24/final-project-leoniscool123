# Load libraries
library(shiny)
library(shinythemes)
library(plotly)

# Introduction page
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  p(
    style = "font-size:18px;", strong(""),
  ),
  p(
    style = "font-size:16px;", ",",
    em(""),
    img(src = ""),
  )
)
# Chart 1 page
line_panel <- tabPanel(
  "Average Rates",
  
)
# Chart 2 page
# Title
bar_title <- titlePanel("Natural Logarithm of Wages Compared to Sleep")

bar_min <- sliderInput("x_axis", "Minutes", min = 0, max = 5000, value = c(0, 5000))

bar_wage <- sliderInput("y_axis", "Natural Logarithmic Wage", min = -1.2, max = 3.7, value = c(-1.2, 3.7))

# Sidebar
bar_sidebar <- sidebarPanel(
  bar_min,
  bar_wage
)

# Main content
bar_main_content <- mainPanel(
  plotlyOutput("scatterPlot"),
  fluidRow(
    column(12,
           p("The purpose behind this plot is to reveal if there is any correlation between wage and sleep. 
             The plot revealed that there is a large cluster around 3100 minutes and a logarithmic wage of 1-2 
             which suggests that individuals who sleep around 3100 minutes a week (or about 7.4 hours a day) 
             are more likely to have their logarithmic wage fall in between 1-2. As the amount of sleep in 
             minutes gets closer to 3100, the average natural logarithmic wage becomes around 1.5. This suggests 
             that if an individual sleeps, on average, 3100 minutes a week that they are more their natural 
             logarithmic is more likely to be close to 1.5. Within the data, however, there are still some outliers: 
             We can see that at around 3100 minutes that there are some individuals who’s natural logarithmic wage 
             is significantly higher and this could be caused by the few individuals who have much larger wages 
             while working the same amount as others. We also can see outliers at around 1000-2000 minutes of sleep range 
             which can suggest that there may be individuals who are able to work and earn a wage close to the average 
             while not needing as much sleep. We can also see outliers at around 4200-4700 minutes of sleep range which 
             can suggest that these individuals might have a much healthier work-life balance which results in them 
             gaining more sleep.")
    )
  )
)


# Entire page
bar_panel <- tabPanel(
  "Wage vs Sleep",
  bar_title,
  bar_sidebar,
  bar_main_content
)


# Chart 3 page
map_panel <- tabPanel(
  
)

# Conclusion page
concl_panel <- tabPanel(
  "Conclusion",
  titlePanel("Insights"),
  p(
    style = "font-size:16px;", ",",
    strong(""),
    img(src = ""),
  )
)

# Define UI
ui <- navbarPage(
  "Sleep vs. Work",
  theme = shinytheme("cerulean"),
  intro_panel,
  line_panel,
  bar_panel,
  map_panel,
  concl_panel
)