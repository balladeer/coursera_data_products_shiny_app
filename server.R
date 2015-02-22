
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

names_df <- read.csv("all_names.csv")
names_df$name <- as.character(names_df$name)

males <- subset(names_df, gender=="M")
females <- subset(names_df, gender=="F")

unique_names <- sort(unique(names_df$name))

shinyServer(function(input, output) {

  output$out_names <- renderPrint(input$name_list)

})
