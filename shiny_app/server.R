library(rCharts)
library(shiny)

names_df <- read.csv("all_names.csv")[, c("name", "gender", "year", "count", "rank")]
names_df$name <- as.character(names_df$name)

males <- subset(names_df, gender=="M")
male_names <- sort(unique(males$name))

females <- subset(names_df, gender=="F")
female_names <- sort(unique(females$name))


shinyServer(function(input, output) {

    ### Server calculations for count-based plot

    # Switch data sets for count-plot based on radio button
    count_data <- reactive({
        if (input$gender_choice=="F"){
            females
        } else {
            males
        }
        })

    # Render a dynamic UI for the name-selection box
    output$name_select_ui <- renderUI({
        if(input$gender_choice == "F"){
            name_options <- female_names
        } else{
            name_options <- male_names
        }

        selectizeInput(
            'name_list', h3('Names to View'),
            choices = name_options,
            multiple = TRUE,
            selected = name_options[1]
        )
    })

    output$name_plot <- renderChart2({
        df <- subset(count_data(), (name %in% input$name_list))# & (year >= input$years[1]) & (year <= input$years[2]))
        df$name <- as.factor(df$name)
        p <- hPlot(count ~ year, data=df, group="name", type="line",
                   title="Baby Names by Year (USA)")
        p$yAxis(title = list(enabled = T, text = "Number of babies w/ name"))
        p$xAxis(title = list(enabled = T, text = "Year"))
        return(p)
    })

    ### Server calculations for rank-based plot
    # Switch data sets for count-plot based on radio button
    rank_data <- reactive({
        if (input$gender_rank_choice=="F"){
            females
        } else {
            males
        }
    })

    output$rank_plot <- renderChart2({
        df <- subset(rank_data(), (year >= input$year_select[1]) & (year <= input$year_select[2]))
        df$name <- as.factor(df$name)
        p <- hPlot(rank ~ year, data=df, group="name", type="line",
                   title="Rank of 20 most-popular baby names by year (USA)")
        p$yAxis(title = list(enabled = T, text = "Rank of name"),
                reversed = T,
                min = 1,
                max = 20)
        p$xAxis(title = list(enabled = T, text = "Year"))
        return(p)
    })

    output$names_table <- renderDataTable(names_df, options = list(
        pageLength=20, searching=T))

})
