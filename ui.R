# Load libraries
library(shiny)
library(shinythemes)
library(plotly)

# Introduction page
intro_panel <- tabPanel(
  "Introduction",
  img(src = "sleep_pic.jpg"),
  titlePanel("Introduction"),
  p(
    style = "font-size:18px;", strong("Team Members"),
    "Leon Nguyen, Samarth Rao, Nicholas Chung, Jonathan Cao"
  ),
  p(
    titlePanel("Abstract"),
    p(style = "font-size:16px;", strong("Our main question is how sleep amount correlates to someone’s earnings and age. 
    To address this question we will be analyzing a dataset containing important statistics regarding factors such as the 
    amount of sleep, age, time spent on work, etc.. We are concerned with this because there is a notion that wealthy people 
    give up sleep to further their careers so we plan to analyze the data, and compare how work-life balance affects sleep patterns. 
"))),
  titlePanel("Intro"),
  p(style = "font-size:16px;", strong("This project aims to find a correlation between the amount of sleep a person gets and work. 
                                        Does age increase or decrease the amount of sleep a person gets? How does the nature of one's 
                                        job, particularly the level of work experience, affect sleep patterns? We will be exploring 
                                        these questions to challenge the notion often perpetuated by successful individuals that sacrificing 
                                        sleep is necessary to maximize career potential. On social media, it's common to see influential 
                                        business people, often making six-figure salaries, advocating for waking up before dawn and maintaining 
                                        a sleep schedule that includes only 4-6 hours of rest per night, far below the amount recommended by 
                                        scientists. These influencers swear by their schedules and guarantee success to those who follow their 
                                        routines. However, this project seeks to explore the potential negative effects of such advice, especially 
                                        for young, impressionable viewers. Consistently sacrificing sleep can impair daily functioning and 
                                        long-term health. By answering these questions, we hope to provide a clearer understanding of how 
                                        different levels of work experience impact sleep, thereby guiding individuals towards finding a sleep 
                                        schedule that is both healthy and conducive to their career goals.")),
  
  titlePanel("Related Work"),
  p(style = "font-size:16px;", strong("In our study we aim to see the relationship between a person’s age, and  work-life, minutes worked, salary, 
    and how it correlates to their sleep. There are a few articles/ research papers that look into the correlation between sleep and work and vice versa. 
    These research articles focus on how sleep affects wages, as well as how long work hours can affect your sleep. This shows a two way relationship on 
    how better sleep can improve your job, but also how your job life can affect your sleep. This is an important connection to learn about as sleep is 
    an important necessity for our body to function and finding ways to correlate/improve everyday activities such as job to improve sleep can greatly
    benefit many in the industry who don’t have a good work-life balance. The first paper discusses work-life balance in South Korea, which is an interesting
    topic because of their different work values from those in the US. The second paper focuses on giving up working time for sleep is beneficial to efficiency 
    and how more workplaces should adopt this strategy. The third paper focuses on the relationship between wages and sleep duration, whether that be increasing 
    or decreasing alongside one another.

Linked Below are 3 research papers that discuss similar correlations…

*  Choi, H., Lee, S., Jeon, M.-J., & Min, Y.-S. (2020, November 3). Relationship between long work hours and self-reported sleep disorders of non-shift 
daytime wage workers in South Korea: Data from the 5th Korean Working Conditions Survey. Annals of occupational and environmental medicine.",
                                      HTML(paste0(a("National Institute of Health", href = "ttps://www.ncbi.nlm.nih.gov/pmc/articles/PMC7779839/"), ",")),
                                      
                                      
                                      " * Gibson, M., & Shrader, J. (2018, December 1). Time use and labor productivity: The returns to sleep. MIT Press.",
                                      HTML(paste0(a("MIT Press Direct", href = "https://direct.mit.edu/rest/article/100/5/783/58488/Time-Use-and-Labor-Productivity-The-Returns-to_sleep"), ",")),
                                      
                                      
                                      " *  Sedigh G;Devlin RA;Grenier G;Deri Armstrong C; (n.d.). Revisiting the relationship between wages and sleep duration: 
The role of insomnia. Economics and human biology.",
                                      HTML(paste0(a("National Institute Of Health", href = "https://pubmed.ncbi.nlm.nih.gov/27987490/
"), ",")),
  )),
  titlePanel("The Dataset"),
  p(style = "font-size:16px;", strong("> Where did you find the data? Please include a link to the data source  

* The data set we’re using was found on",  HTML(paste0(a("Kaggle", href = "https://www.kaggle.com/datasets/kapturovalexander/sleep-patterns/data"), ",")), 

" > Who collected the data?  
 
* The data was collected by Alexander Kapturov

> How was the data collected or generated?  

* While we do not know the exact reason this dataset was collected, we can make an educated guess that this dataset was collected using surveys, 
or crowdsourcing to efficiently collect different data from a large sample group.

> Why was the data collected?  

* Just like the previous question we do not have an exact answer, but we can assume that this dataset was to correlate how different factors 
and sleep are related to understand what can affect our sleep. 

>How many observations (rows) are in your data?  

* There are 706 rows in this dataset.

> How many features (columns) are in the data?  

* There are 34 columns in this dataset.

> What, if any, ethical questions or questions of power do you need to consider when working with this data?  

* While working with this dataset, we need to make sure that we don’t create biased analysis as this could lead to incorrect assumptions 
being made through a person’s characteristics and their sleep behavior which could be detrimental when those groups are trying to improve sleep habits. 

> What are possible limitations or problems with this data?  

* One possible limitation with this data is that we are unable to consider specific professions when analyzing the dataset. Since this feature 
                                        is not included in the dataset, we instead need to analyze the amount of sleep with other relevant 
                                        features such as time spent working. Another possible problem with this dataset is the noise (or outliers) 
                                        in the dataset. Since it is very common for datasets to include outliers, these outliers may cause the results 
                                        of our analysis to show inaccurate relationships. For example, there could be an individual in the dataset who
                                        has almost no work experience, but is naturally talented and is able to spend less time working. This could make 
                                        it appear that less work experience means less time spent working when in actuality the relationship is less work 
                                        experience means more time spent working due to inexperience. Another possible limitation is that since we do not 
                                        know exactly where this dataset came from the dataset may represent people who are in a location where wages are 
                                        on average higher. For example, Country A may have an extremely high average wage whereas Country B may have a 
                                        lower average wage, however, if the dataset was collected from Country A it may lead us to believe that a higher
                                        wage has a much larger effect on the amount of sleep than it actually does.")),
      titlePanel("Possible Limitations"),
      p(style = "font-size:16px;", strong("One possible limitation with this data is that we are unable to consider specific professions when analyzing 
                                          the dataset. Since this feature is not included in the dataset, we instead need to analyze the amount of sleep 
                                          with other relevant features such as time spent working. Another possible problem with this dataset is the noise 
                                          (or outliers) in the dataset. Since it is very common for datasets to include outliers, these outliers may cause 
                                          the results of our analysis to show inaccurate relationships. For example, there could be an individual in the 
                                          dataset who has almost no work experience, but is naturally talented and is able to spend less time working. 
                                          This could make it appear that less work experience means less time spent working when in actuality the relationship 
                                          is less work experience means more time spent working due to inexperience. Another possible limitation is that since 
                                          we do not know exactly where this dataset came from the dataset may represent people who are in a location where 
                                          wages are on average higher. For example, Country A may have an extremely high average wage whereas Country B may 
                                          have a lower average wage, however, if the dataset was collected from Country A it may lead us to believe that a 
                                          higher wage has a much larger effect on the amount of sleep than it actually does.")),
        titlePanel("Possible Limitations"),
        p(style = "font-size:16px;", strong("Ultimately, our project explores
    questions regarding the trends of
  food insecurity over time, food gaps between different races, and
  the success of food assistance programs, as well as the existence
  of potential
  food deserts.")),
        titlePanel("Implications"),
        p(style = "font-size:16px;", strong("Following our research into the topic of how age and work-life correlates to the amount of sleep we have a 
                                            few expected or possible implications. Firstly, one expected implication for policymakers is that they can 
                                            take this research into consideration when on the topic of work hours at their company. For example, companies 
                                            can utilize this research to create a more healthy work-life balance if it is discovered that less amount of 
                                            sleep has a negative impact on the work quality. Secondly, another possible implication for policymakers is 
                                            that they can utilize this research to decide proper wages based on how much an individual spends working. 
                                            This can in turn influence a more productive environment as a higher wage may incentivize productivity. 
                                            Finally, one other possible implication for designers of a workplace is that they can utilize this research 
                                            to decide the effective amount of work hours that an employee should work based on their work experience and 
                                            wage. For example, if it is discovered that an employee who has a good amount of sleep and high work experience 
                                            is extremely effective in the workplace, designers can take this into consideration and maybe consider less 
                                            working hours for those with higher experience in order to make the work produced even more effective.")),
        titlePanel("Limitations and Challenges"),
        p(style = "font-size:16px;", strong("Some of the limitations and challenges with this dataset is that, we don’t have access to a column that 
                                            contains the person’s occupation. Having access to this data, in addition to the data that we are currently 
                                            analyzing, would allow us to make a stronger connection between work-life balance as we could understand 
                                            different types and occupations (labor intensive, office/desk job), and how they could factor into our dataset. 
                                            The fact that we do not have a lot of background information about our dataset, also limits our analysis, 
                                            because where the data was collected and how it was collected could have a large influence on how we look at 
                                            the data and results in general. For example, if we collected the data in a country, where working conditions
                                            are worse, then our data might tell us a different story and connection, then if we measured these data points
                                            in another country where working conditions are improved. While this does not stop us from making a correlation
                                            with our data, knowing this information could make our correlation more thorough and let us tell a better story 
                                            with our data.")),
)

chart_1_title <- titlePanel("REPLACE WITH CHART 1 TITLE")

# ADD WIDGETS

#REFERNCE chart2_min and chart2_sidebar and chart2_main_content for how to format rest of chart

chart_1_panel <- tabPanel(
  "TAB TITLE HERE"
)

chart_2_title <- titlePanel("Natural Logarithm of Wages Compared to Sleep")
chart_2_min <- sliderInput("x_axis", "Minutes", min = 0, max = 5000, value = c(0, 5000))

chart_2_wage <- sliderInput("y_axis", "Natural Logarithmic Wage", min = -1.2, max = 3.7, value = c(-1.2, 3.7))


chart_2_sidebar <- sidebarPanel(
  chart_2_min,
  chart_2_wage
)


chart_2_main_content <- mainPanel(
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



chart_2_panel <- tabPanel(
  "Wage vs Sleep",
  chart_2_title,
  chart_2_sidebar,
  chart_2_main_content
)

chart3title <- titlePanel("How Experience Relates To Total Hours Worked")

gender_dropdown <- sidebarPanel(
  selectInput(
    inputId = "gender",
    label = "Gender",
    choices = c(
      "0 - Female",
      "1 - Male"
    ),
    selected = "",
  )
)

age_slider <- sidebarPanel(
  sliderInput("age_slider", "Select An Age Range", min = 10, max = 60, value = 10)
)

chart3sidebar <- sidebarLayout(
  age_slider,
  gender_dropdown
)

chart3main_content <- mainPanel(
  plotlyOutput("chart3"),
  fluidRow(
    column(12,
           p("This chart allows us to see if people work more/less or if there is no change as they get more experienced. This allows us to understand the work balance as people get older and go further in the industry. It also lets us relate the graphs through the connection between age and experience.
           If we understand what factors lead people to work more, sleep less, we can have an easier time remidying those changes. We see as the experience goes up the amount hours works tends to go down, but this change happens more near the end of the plot. People tend to work less as they gain more experience.  We also know that there is a relationship between age and experience through prior experiences.  As age increases so does ones experience. We can use this to relate to the first graph. Our Chart 1 tells us that as age increases so does the hours slept. That means as age goes up so does experience and people sleep and work less. This leans us to the conclusion that people who work more with more experience in their job, gain a better work-life balance.
")
    )
  )
)

chart3_panel <- tabPanel(
  "Experience vs. Hours Worked",
  chart3title, 
  chart3sidebar, 
  chart3main_content
)


concl_panel <- tabPanel(
  "Conclusion",
  titlePanel("Conclusion"),
  p(
    style = "font-size:16px;", strong("Our investigation into the link between sleep, work, age, and experience revealed numerous major findings that call into question prevalent assumptions about work-life balance and productivity. First, we discovered a positive relationship between age and the average number of hours slept per day. Older adults tend to sleep more, implying that as people age and gain experience, they learn to value sleep and recognize its relevance for general health and productivity. This conclusion is significant because it contradicts the commonly held view that sacrificing sleep is required for job progress, which is regularly encouraged by powerful corporate personalities.

Second, our findings demonstrated an inverse link between work experience and the amount of hours worked each day. Individuals with more experience tend to work fewer hours due to improved efficiency and experience. This insight emphasizes that gaining expertise ovr time can lead to a better work-life balance, since experienced employees can produce the same or better results in less time than their less experienced colleagues. This conclusion highlights the importance of experience and proposes that businesses explore policies that promote efficiency and productivity rather than just hours spent.

Finally, our analysis of salaries and sleep patterns found that people who slept approximately 7.4 hours per day earn greater wages. This emphasizes the necessity of getting enough sleep for job performance and profitability. However, the presence of outliers in the data implies that individual differences in sleep requirements and work habits can also result in positive consequences. Despite getting less sleep, some people function well and earn high earnings, while others get more sleep and have a healthy work-life balance.

These findings highlight the importance of prioritizing sleep and efficiency in the job. They recommend that both individuals and policymakers endeavor to promote a good work-life balance in order to increase productivity and well-being. Employers could consider creating regulations that promote proper rest and acknowledge the importance of experience and efficiency above sheer hours spent. This allows them to create a more productive, healthier, and contented staff."),
   
  )
)


ui <- navbarPage(
  "Sleep vs. Work",
  theme = shinytheme("cerulean"),
  intro_panel,
  chart_1_panel,
  chart_2_panel,
  chart3_panel,
  concl_panel
)