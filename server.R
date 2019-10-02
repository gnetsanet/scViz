#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
options(shiny.maxRequestSize=100*1024^2)

# Define server logic required to draw a histogram
shinyServer(
    
    function(input, output) {
        
        data <- reactive({
            file1 <- input$file
            if(is.null(file1)) { return()}
            #read.table(file=file1$datapath, sep=input$sep, header=input$header, stringAsFactors=input$stringAsFactors)
            read.table(file=file1$datapath, sep=input$sep, header=input$header)
        })
        
        output$filedf <- renderTable ({
            if(is.null(data())) { return () }
            input$file
        })
        
        
        output$sum <- renderTable({
            if(is.null(data())) {return ()}
            summary(data())
        })
        
        output$table <- renderTable({
            if(is.null(data())) { return ()}
            head(data())
        })
        
        output$tb <- renderUI({
            if(is.null(data())) { return () }
            else
                tabsetPanel(
                    tabPanel("About file", tableOutput("filedf")),
                    tabPanel("Data", tableOutput("table")),
                    tabPanel("Summary", tableOutput("sum"))
                )
        })
        
    }
)