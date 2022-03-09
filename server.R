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
}
