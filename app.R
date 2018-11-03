library(shiny)
source('helper.R')
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        dataTableOutput('candidates'),
         actionButton('go', 'Go')
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        DT::dataTableOutput('results')
      )
   )
)
results <- data.frame()
# Define server logic required to draw a histogram
server <- function(input, output, session) {
  output$candidates <- DT::renderDataTable(candidates, options = list(pagelength = 10))
  observeEvent(input$go, {
    output$results <- renderDataTable({
      Awards <- candidates[sample(candidates$Phone,1),]
      results <- rbind(results,Awards)})
  })
  results <- results
}

# Run the application 
shinyApp(ui = ui, server = server)
