library(ggplot2)
library(plotly)
library(bslib)

sat_data <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/final-project-ErikOnsager/main/scores.csv?token=GHSAT0AAAAAABQJHLQQURNL43ANC2TAQAV4YRSKOGQ")

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(primary = "#091F43", font_scale = NULL, bootswatch = "cerulean"),
    h1("Introduction"),
    img("Students taking SAT in NYC", src = "https://static01.nyt.com/images/2018/01/12/nyregion/12sat/merlin_117850502_971354fa-3195-4f7b-b94b-56e2a5baf289-superJumbo.jpg", 
        width="800", 
        height="400"),
    p("Our project analyses a data set that consists of the average SAT scores for New York City public schools during the year 2014 - 2015. 
    Our group has seen that history has shown us how rigged such standardised systems can be, with celebrities buying scores for their children and students paying fake test takers to forge higher scores. 
    In order to understand the corruption and dispersion in test scores, we are motivated to analyse the sociodemographic factors that affect this and bring light to the issue and challenges these students face.  
    These questions spur interest because it allows us to analyse how different factors from race to location can influence a student’s scores.
    
    Some research questions that we are interested in are:"), 
    em("1. How does the cultural divide among students affect their individual scores?
    2. How do the different locations (eg. columns = Borough) affect access to resources that influence students’ scores? 
    3. How do income levels between different racial groups trigger student scores? 
    4. Do public schools with higher enrollment numbers perform better?"),
    p("In this project, our team has chosen to analyze multiple values from the data set such as student enrollment, average SAT scores, race, income, and location. "),
    h3("Who collected the data?"),
    p("The data was collected by NYC Open Data, a program that makes information used by the City government available to the public for free, and can be found at the following URL:"),  tags$a(href="https://www.kaggle.com/nycopendata/high-schools","Nycopendata"),
    h3("How was the data collected or generated?"),
    p("The data is collected from two sources: The high school data was compiled by the New York City Department of Education and the SAT data was provided by the College Board."),
    h3("Why was the data collected?"),
    p("The data was collected to answer the following questions: “Which public high school's students received the highest overall SAT score? The highest score for each section? Which borough has the highest performing schools? Do schools with lower student enrollment perform better?"),
    h3("What are possible limitations or ethical problems with this data?"),
    p("In order to consider the ethical questions, we will look at how we can recognize bias and avoid our own personal bias. We want to consider what communities may be harmed by our data analysis. For limitations, the data only provides the average scores and the race breakdown of each school so comparisons can only be made on one set of standardized scores, which limits the conclusions that can be made. 
      We cannot make race breakdowns or individual scores. Moreover, there are only 4 races noted in the data: White, Black, Hispanic, and Asian and there is no gender. We cannot evaluate gender bias even though this issue can cause skewing. Another problem in the data set is that some of the schools have missing information about SAT scores or race breakdowns which can create gaps. 
      To avoid these limitations, it is important for the dataset to be cleansed and erased of possibly biased numbers. At the end of this, we will be able to see how public schools perform when compared to others and how New York City’s diversity plays a role in the testing numbers."),
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
  img("Students taking SAT", src = "https://www.iecaonline.com/wp-content/uploads/2017/03/sat.jpg", 
      width="850", 
      height="400"),
  h3("Summary Takeaways"),
  p("_____________________"),
)


ui <- navbarPage(
  "SAT Stats from NYC High Schools",
  intro_tab,
  interactive_tab_1,
  interactive_tab_2,
  interactive_tab_3,
  conclusion_tab
)
