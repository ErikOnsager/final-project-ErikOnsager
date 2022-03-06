library(ggplot2)
library(plotly)
library(bslib)

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
  #selectInput("user_input", "Select Region to Plot", choices = climate_data$country)
)

plot1_main <- mainPanel(
  #plotlyOutput(outputId = "____")
)

interactive_tab_1 <- tabPanel(
  "Chart 1",
  sidebarLayout(
    plot1_sidebar,
    plot1_main
  )
)


plot2_sidebar <- sidebarPanel(
  #selectInput("user_input", "Select Region to Plot", choices = climate_data$country)
)

plot2_main <- mainPanel(
  #plotlyOutput(outputId = "____")
)

interactive_tab_2 <- tabPanel(
  "Chart 2",
  sidebarLayout(
    plot2_sidebar,
    plot2_main
  )
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
