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
     200 and 700, with most average total SAT scores ranging from 1000 to 1400. An important consideration is that student enrollment is also
    dependent on the type of school and location of the school. This means that demographics plays an indirect role in the graph, and indicates
    that different cities would be providing different variabilities of ease of access to school.")
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
     In general, schools with a greater percentage of Whites and Asians have higher SAT scores while schools with a greater percentage of Black and Hispanic groups
     have lower SAT scores. This is a problematic trend which highlights the injustice in our education systems. It represents
    the need for schools to be eradicating such discrimination as it can hold long lasting impressions in the minds of such young children.")
)


plot3_sidebar <- sidebarPanel(
  selectInput("city_input", "Select City to Plot", choices = sat_data$City, selected = 'Manhattan', multiple = TRUE)
)

plot3_main <- mainPanel(
  plotlyOutput(outputId = "testedPlot")
)

interactive_tab_3 <- tabPanel(
  "Chart 3: Percent Tested",
  sidebarLayout(
    plot3_sidebar,
    plot3_main
  ),
  br(),
  p("The graph above is a scatterchart of the average score vs percentage of students tested for the SAT in a city of
    the user's choice. The widget on the left allows the user to choose a specific city of interest, thus making
    the app interactive. Through the graph, a pattern is noticeable where densely populated cities (eg. Manhattan,
    Brooklyn) have higher average scores. This could also be attributed to the fact that there are more test takers
    in such locations, due to the higher level of access. In comparison, places such as Jamaica or Saint Albans have
    much lower data points visible.")
)


conclusion_tab <- tabPanel(
  "Conclusion",
  h1("Conclusion"),
  img("Students taking SAT", src = "https://www.iecaonline.com/wp-content/uploads/2017/03/sat.jpg", 
      width="850", 
      height="400"),
  h3("Summary Takeaways"),
  p("Our data analysis has led us to be able to answer the questions we were seeking to answer at the start. Our group wanted to bring light to the issues and look deeper at the standardized testing system. 

Throughout our graphs, we were able to first see how student enrollment and average SAT scores would compare. Our group split up the data in order to see each part of the SAT scores such as math, English, reading, and overall scores.  We were able to determine how most student enrollment falls between 200 and 700 and the average total SAT scores ranged from about 1000 to 1400. The main takeaway from our first chart was the overall SAT score compared to student enrollment which showed that generally as enrollment increases, SAT scores do as well. This could indicate how schools with a bigger population are able to provide more help to students which helps us answer our fourth question that we sought out. 

Our second takeaway would be race compared to SAT scores and the correlation between the two. Our second chart was able to show how in general, schools with greater percent White and Asian have higher SAT scores while schools with greater percent Black and Hispanic have lower SAT scores.  This chart is important to our insight since it can indicate the importance of location and race. Hispanic and Black students may not be receiving the same resources and this trend highlights the injustice in our education systems for these students. This helps us understand our first and third question better since we can see the difference between races.
Lastly, we viewed how race and demographic affects percentage tested. This can be seen through our last graph and some of our second graph. This is important for our first question and second question since we see the divide between race and demographics. This can cause students to not have resources available to take the test which we see that the number indicates this through the graph.

We were able to answer all of the questions we sought out to however, our data only tracks students from New York. The trends we observe may not fully represent the issues with current standardized testing practices. Our data also only spans one year, which means it is more likely that anomalies could affect our analysis. Another issue is that our dataset does not report factors like household income and level of education of the students’ parents, which are factors likely to affect performance on standardized tests. Furthermore, the race breakdowns listed are based on the whole student body of the school, not just those who were tested. Therefore, it is possible that in schools with lower testing rates, the students who were tested are not representative of the overall demographics of the school. We recognize these limitations throughout our analysis however, we have created insight and provided a better understanding of how students in NYC perform on the SAT to hopefully bring forth changes."),
)


ui <- navbarPage(
  "SAT Stats from NYC High Schools",
  intro_tab,
  interactive_tab_1,
  interactive_tab_2,
  interactive_tab_3,
  conclusion_tab
)
