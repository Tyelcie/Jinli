library(shiny)
library(ggplot2)
library(gganimate)
source('helper.R')

ui <- fluidPage(
   titlePanel("Fancy Carps"),

   sidebarLayout(
      sidebarPanel(
        dataTableOutput('candidates'),width = 3
      ),
      mainPanel(
                 plotOutput('award'),
                 tags$hr(),
                 actionButton('normal', 'Normal'),
                 actionButton('refresh', 'Another'),
                 actionButton('special', 'Special'))
   )
)

server <- function(input, output, session) {
  output$candidates <- renderDataTable(candidates, options = list(pageLength = 15))
  observeEvent(input$normal, {
    id <- sample(candidates$ID, 1)
    temp <- candidates[id,]
    DeleteData(id)
    # AddNormal(id)
    output$award <- renderPlot({
      ggplot(temp) +
        geom_text(aes(label = paste(ID,': ', Phone), x = 5, y = 5), size = 12)+
        theme_void()
    })
  })
    observeEvent(input$special, {
      id <- sample(candidates$ID, 1)
      temp <- candidates[id,]
      DeleteData(id)
      # AddSpecial(id)
      output$award <- renderPlot({
        ggplot(temp) +
          geom_text(aes(label = paste(ID,': ', Phone), x = 0.5, y = 0.5), size = 12)+
          theme_void()
      })
      })
    observeEvent(input$refresh,{
      session$reload()
    })
}

shinyApp(ui = ui, server = server)
