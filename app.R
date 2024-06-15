ui <- fluidPage(
  
  selectizeInput("dist", "Дистанция", distances, options = list(maxItems = 100)),
  numericInput("races", "Число дорожек:", 8),
  selectInput("sex", "Пол:", sexes),
  selectizeInput("years", "Год рождения", byears, options = list(maxItems = 5)),
  actionButton("do", "Скачать документ"),
  textOutput("numb"),
  tableOutput("tbl")
  
)

server <- function(input, output, session) {
  
  output$tbl <- renderTable({
    
    map_df(input$dist, \(i) {
      
      rbindlist({
        
        by_swim(tbl = DT,
                sx = input$sex,
                dist = i,
                by = input$years,
                races = input$races)
        
      }, fill = T)
      
    }) |>
      mutate(time = str_remove(format(time, '%M:%S:%OS'), pattern = '00:'),
             byear = as.character(byear))
    
  })
  
  output$tbl2 <- renderTable({
    
    
    
  })
  
  uploadItems <- eventReactive(input$do, {
    
    
    
  })
  
  output$numb <- renderText(uploadItems())
  
}

shinyApp(ui = ui, server = server)