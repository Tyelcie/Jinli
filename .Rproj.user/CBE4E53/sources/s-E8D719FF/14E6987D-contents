library(shiny)
source('helper.R')

ui <- fluidPage(
   
   # Application title
   titlePanel("解螺旋锦鲤"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        dataTableOutput('candidates')
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        submitButton('go', '抽大奖'),
        dataTableOutput('results')
      )
   )
)

server <- function(input, output, session) {
  output$candidates <- renderDataTable(candidates)
  observeEvent(input$go, {
    
    output$results <- renderDataTable({
      Awards <- candidates[sample(candidates$Phone,1),]
      candidates <- candidates[-match(awards$Phone, candidates$Phone),]
      results <- rbind(results,Awards)})
  })
  results <- results
}


shinyApp(ui = ui, server = server)
