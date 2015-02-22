library(rCharts)
library(shiny)

names_df <- read.csv("all_names.csv")[, c("name", "gender", "year", "count", "rank")]
names_df$name <- as.character(names_df$name)

males <- subset(names_df, gender=="M")
male_names <- sort(unique(males$name))

females <- subset(names_df, gender=="F")
female_names <- sort(unique(females$name))


shinyServer(function(input, output) {

    data <- reactive({
        if (input$gender_choice=="F"){
            females
        } else {
            males
        }
        })
    #output$out_names <- renderPrint(input$name_list)
    #output$num_names <- renderPrint(head(data()))

    # Render a dynamic UI for the name-selection box
    output$name_select_ui <- renderUI({
        if(input$gender_choice == "F"){
            name_options <- female_names
        } else{
            name_options <- male_names
        }

        selectizeInput(
            'name_list', 'Choose names to follow',
            choices = name_options,
            multiple = TRUE,
            selected = name_options[1]
        )
    })

    output$name_plot <- renderChart2({
        print(class(input$years[1]))
        print(input$years[1])
        df <- subset(data(), (name %in% input$name_list) & (year >= input$years[1]) & (year <= input$years[2]))
        df$name <- as.factor(df$name)
        print(df)
        h1 <- hPlot(
            x = "year",
            y = "count",
            group = "name",
            data = df,
            type = "line")

        #h1$colors(c("red", "blue"))
        print(attributes(h1))
        h1$yAxis(title = list(enabled = TRUE, text = 'Babies born w/ Name'))
        return(h1)
    })

    output$names_table <- renderDataTable(data(), options = list(
        pageLength=20, searching=T))

})
