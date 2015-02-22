library(rCharts)
library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("United States Baby Names by year"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        # Gender to explore
        radioButtons("gender_choice", label = h3("Gender"),
                     choices = list("Male" = "M", "Female" = "F"),
                     selected = "M"),

        # Select year range to plot
        sliderInput("years", "Year Range:",
                    min = 1960, max = 2013, value = c(1960, 2000), sep="", step=1),

        # Select names to plot
#         selectizeInput(
#           'name_list', 'Choose names to follow', choices = unique_names, #as.character(names_df[1:20, "name"]),
#           multiple = TRUE
#         )
        uiOutput("name_select_ui")
    ),

    #
    mainPanel(
      showOutput("name_plot", "highcharts"),
      #verbatimTextOutput('out_names'),
      #verbatimTextOutput('num_names')
      dataTableOutput('names_table')
    )
  )
))
