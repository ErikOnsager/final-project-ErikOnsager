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
}
