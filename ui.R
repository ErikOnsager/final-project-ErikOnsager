library(ggplot2)
library(plotly)
library(bslib)

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/final-project-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQJHLQQURNL43ANC2TAQAV4YRSKOGQ")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(primary = "#091F43", font_scale = NULL, bootswatch = "cerulean"),
    h1("Introduction"),
    p("In this project, our team has chosen to analyze _______"),
    h3("Who collected the data?"),
    p("The data was collected by____, and can be found at the following URL: _____"),
    h3("How was the data collected or generated?"),
    p("The data is collected from ______"),
    h3("Why was the data collected?"),
    p("The data was collected to ________"),
    h3("What are possible limitations or problems with this data?"),
    p("_______"),
    #Add flair/image
  )
)


plot1_sidebar <- sidebarPanel(
  selectInput("user_input", "Select SAT scores to plot", choices = c('Math', 'Reading', 'Writing', 'Total'))
)

plot1_main <- mainPanel(
  plotlyOutput(outputId = "enrollmentPlot")
)

interactive_tab_1 <- tabPanel(
  "Chart 1: Enrollment",
  sidebarLayout(
    plot1_sidebar,
    plot1_main
  ),
  p("This chart was included to explore how student enrollment and average SAT score of a school are connected. It shows that generally as enrollment increases, SAT scores do as well.
     Some other insights from the chart are: Reading and Writing scores tend to be very similar to each other, while Math has a weaker correlation to the others. Finally, most student enrollment falls between
     200 and 700, with most average total SAT scores ranging from 1000 to 1400.")
)


plot2_sidebar <- sidebarPanel(
  selectInput("race_input", "Select race to plot", choices = c('White', 'Black', 'Hispanic', 'Asian'))
)

plot2_main <- mainPanel(
  plotlyOutput(outputId = "racesPlot")
)

interactive_tab_2 <- tabPanel(
  "Chart 2: Races",
  sidebarLayout(
    plot2_sidebar,
    plot2_main
  ),
  p("This chart shows the correlation between the racial makeup of schools and the average total SAT score of that school. 
     In general, schools with greater percent White and Asian have higher SAT scores while schools with greater percent Black and Hispanic
     have lower SAT scores. This is a problematic trend which highlights injustice in our education systems")
)


plot3_sidebar <- sidebarPanel(
  #selectInput("user_input", "Select Region to Plot", choices = climate_data$country)
)

plot3_main <- mainPanel(
  #plotlyOutput(outputId = "____")
)

interactive_tab_3 <- tabPanel(
  "Chart 3",
  sidebarLayout(
    plot3_sidebar,
    plot3_main
  )
)


conclusion_tab <- tabPanel(
  "Conclusion",
  h1("Conclusion"),
  h3("Summary Takeaways"),
  p("_____________________"),
)


ui <- navbarPage(
  "Title",
  intro_tab,
  interactive_tab_1,
  interactive_tab_2,
  interactive_tab_3,
  conclusion_tab
)
