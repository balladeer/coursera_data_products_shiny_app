
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("United States Baby Names by year"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectizeInput(
          'name_list', 'Choose names to follow', choices = unique_names, #as.character(names_df[1:20, "name"]),
          multiple = TRUE
      )
    ),

    #
    mainPanel(
      plotOutput("distPlot"),
      verbatimTextOutput('out_names')
    )
  )
))
