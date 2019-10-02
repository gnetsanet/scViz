require(shiny)
require(Seurat)
require(dplyr)
require(Matrix)
require(plotly)
require(DT)



shinyUI(fluidPage(
   
    # Application title
    
        titlePanel("Sentiment Analysis"),
        
    sidebarLayout(
        
        # Sidebar panel
            sidebarPanel(
                fileInput("file", "Upload raw data"),
                #tags$hr(),
                #br(),
                checkboxInput(inputId='header', label='Header', value=FALSE),
                #checkboxInput(inputId='stringAsFactors', label='stringAsFactors', value=TRUE),
                radioButtons(inputId='sep', label='Separator', choices=c(Comma=',', Semicolon=';', Tab='\t', Space=''), selected='\t')
            ),
    
        # Main Panel
            mainPanel(
               uiOutput("tb")
            )
    
        )
    )
)