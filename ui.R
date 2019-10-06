require(shiny)
require(Seurat)
require(dplyr)
require(Matrix)
require(plotly)
require(DT)
require(shinydashboard)

dashboardPage(title = 'sciViz',
    dashboardHeader(title = "SciViz"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Import Data", tabName = "dataUpload", icon = icon("cloud-upload")),
            menuItem("Widgets", tabName = "widgets", icon = icon("th")),
            menuItem("Visit-us", icon = icon("send",lib='glyphicon'), 
                     href = "https://github.com/gnetsanet")
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(tabName = "dataUpload",
                    fluidRow(
                        box(
                            fileInput("file", "Upload raw data"),
                            checkboxInput(inputId='header', label='Header', value=FALSE),
                            radioButtons(inputId='sep', label='Separator', choices=c(Comma=',', Semicolon=';', Tab='\t', Space=''), selected='\t')
                        ),
                        
                        # CONTROLS
                        box(
                            
                            title = "Controls",
                            
                            # Choose a column
                            selectInput(
                                "columnChoice",
                                "Choose a column:",
                                choices = colnames(df),
                                selected = "n"),
                            
                            sliderInput("slider", "Number of observations:", 1, 100, 50),
                            
                            # Create an eventReactive element
                            actionButton(
                                inputId = "submit",
                                label = "Submit column")
                            
                        ),
                        # PLOT THE THTINGS
                        box( plotOutput("histPlot") )
                    )
            ),
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
        )
    )
    ,
    skin='blue'
)