

# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

# This app was developed to help people choose the best car for their trip, using mtcars dataset, from [R] 

library(markdown)

shinyUI(navbarPage("Find suitable car for the trip >>>",
                   tabPanel("Table",
                            
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Selection criteria"),
                                numericInput('dis', 'Estimated Mileage:', 50, min = 1, max = 1000),
                                numericInput('cost', 'Estimated Gas price:', 2.00, min = 2, max = 4, step=0.25),
                                #sliderInput('cost','Estimated Gas Price:',min=2,max=400,value=c(2,400),step=25),
                                #numericInput('gas', '$ Budget:', 30, min=1, max=500),
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                            )
                              ,
                              mainPanel(
                                dataTableOutput('table')

                              )
                            )
                   )
                   ,
                   tabPanel("Plot",
                            mainPanel(
                              plotOutput('plot')
                              )
                   )
                   ,
                   tabPanel("About",
                            mainPanel(
                              includeMarkdown("about.md")
                            )
                   )
  ) 
)

