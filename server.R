library(ggplot2)
library(plotly)
library(dplyr)

server <- function(input, output) {
  
  output$enrollmentPlot <- renderPlotly({
    
    df <- sat_data %>% mutate('Total' = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.) %>% 
                        rename('Math' = Average.Score..SAT.Math., 'Reading' = Average.Score..SAT.Reading., 'Writing' = Average.Score..SAT.Writing., 'Student Enrollment' = Student.Enrollment)
    
    enrollPlot <- df %>% ggplot(aes(x = `Student Enrollment`)) + geom_point(aes_string(y = input$user_input), stat = "identity") + labs(title = "Average SAT Scores Vs. Student Enrollment") +
      theme(plot.title = element_text(hjust = 0.5))
    
    enrollPlot <- ggplotly(enrollPlot)
    
    return(enrollPlot)
  })
  
  output$racesPlot <- renderPlotly({
    
    df <- sat_data %>% mutate('Total' = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.) %>%
                        rename('White' = Percent.White, 'Black' = Percent.Black, 'Hispanic' = Percent.Hispanic, 'Asian' = Percent.Asian)
    
    df$White <- as.numeric(gsub("%$", "", df$White))
    df$Black <- as.numeric(gsub("%$", "", df$Black))
    df$Hispanic <- as.numeric(gsub("%$", "", df$Hispanic))
    df$Asian <- as.numeric(gsub("%$", "", df$Asian))
    
    
    racePlot <- df %>% ggplot(aes(y = Total)) + 
      geom_point(aes_string(x = input$race_input)) +
      labs(title = "Average SAT Scores Vs. Percent Race", x = paste("Percent", input$race_input), y = "Average Total SAT Score") +
      theme(plot.title = element_text(hjust = 0.5))
      
    
    racePlot <- ggplotly(racePlot)
    
    return(racePlot)
  })
  
  output$testedPlot <- renderPlotly({
    
    sat_data <- sat_data %>% filter(City %in% input$city_input)
    
    sat_data <- sat_data %>% mutate(average_total_score = Average.Score..SAT.Math. + Average.Score..SAT.Reading. + Average.Score..SAT.Writing.)
    
    sat_data$Percent.Tested <- gsub("%$", "", sat_data$Percent.Tested)
    sat_data$Percent.Tested <- as.numeric(sat_data$Percent.Tested)
    `Percent Tested` <- sat_data$Percent.Tested
    `Average Score` <- sat_data$average_total_score
    
    my_plot <- ggplot() +
      geom_point(aes(x = `Percent Tested`, y = `Average Score`, fill = sat_data$City)) +
      labs(title = 'Average Score vs Percent Tested', x = 'Percent Tested', y = 'Average Score', fill = 'City: ')
    
    my_plotly_plot <- ggplotly(my_plot)
    
    return(my_plotly_plot)
    
  })
}
