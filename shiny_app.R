library(shiny)
library(data.table)
library(DT)


args <- commandArgs(trailingOnly=T)
port <- as.numeric(args[[1]])

source('Scripts/read_data.R')

vars <- setdiff(names(bikes), c("datetime", "season", "holiday", "workingday", "weather", "casual","registered", "count"))

ui <- fluidPage(
  # k-means only works with numerical variables,
  # so don't give the user the option to select
  # a categorical variable
  
  pageWithSidebar(
    headerPanel('Bikes k-means clustering'),
    sidebarPanel(
      selectInput('xcol', 'X Variable', vars),
      selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
      numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
    ),
    mainPanel(
      plotOutput('plot1')
    )
  )
  
  
  
)
function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    bikes[, c(input$xcol, input$ycol)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
}

# Run the application 
#shinyApp(ui = ui, server = server)
shinyApp(ui = ui, server = server, options = list(port=port,
                                                  host="0.0.0.0"))
