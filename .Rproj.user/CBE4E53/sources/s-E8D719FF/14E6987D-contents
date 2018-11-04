library(shiny)
source('helper.R')

ui <- fluidPage(
   titlePanel("解螺旋锦鲤"),

   sidebarLayout(
      sidebarPanel(
        dataTableOutput('candidates')
      ),
      mainPanel(
        actionButton('new', 'new'),
        actionButton('refresh', 'refresh'),
        plotOutput('results')
      )
   )
)

server <- function(input, output, session) {
  output$candidates <- renderDataTable(candidates, options = list(pageLength = 10))
  observeEvent(input$new, {
    id <- sample(candidates$ID, 1)
    temp <- candidates[id,]
    DeleteData(id)
    output$results <- renderPlot({
      plot.new()
      text(0.5,0.5, paste0('Phone: ', temp$Phone, cex = 3))
      #text(0.5,0.3, paste0('ID: ', temp$ID, cex = 2))
    })
    observeEvent(input$refresh,{
      session$reload()
    })
  })
}


shinyApp(ui = ui, server = server)
