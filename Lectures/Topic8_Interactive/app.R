#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(plotly)
library(scales)

sp500<-read_rds("sp500.rds")

sector_list<-unique(sp500$sector)

dashboard_function <- function(variable_to_select = "Close",
                               number_to_select = 25,
                               sector_to_select = "Information Technology") {
  gg <-
    sp500 %>%
    filter(sector == sector_to_select,
           symbol_rank <= number_to_select) %>%
    ggplot(aes(x = Date,
               y = .data[[variable_to_select]],
               color = company)) +
    geom_point(aes(text = paste0(
      company, ": ",
      number(.data[[variable_to_select]], accuracy = .1)
    ))) +
    geom_smooth(aes(x = Date,
                    y = .data[[variable_to_select]],
                    color = company),
                se = FALSE) +
    theme(legend.position = "none")


  out <- ggplotly(gg, tooltip = "text")
  out
}

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Top Performing Companies by Sector"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("number_to_select",
                        "Number of Companies",
                        min = 1,
                        max = 25,
                        value = 10),
            selectInput(
              "variable_to_select",
              "Choose Outcome to Plot",
              choices = c("Close", "Percent Change"),
              selected = "Close"
            ),
            selectInput(
              "sector_to_select",
              "Choose Sector",
              choices =sector_list,
              selected = "Close"
            ),
        ),

        # Show a plotly object
        mainPanel(
           plotlyOutput("sp500dashboard")
        )
    )
)

# Define server logic required to draw a graphic
server <- function(input, output) {

  ## Execute function
  output$sp500dashboard <- renderPlotly({

    req(input$number_to_select,input$variable_to_select,input$sector_to_select)

dashboard_function(number_to_select = input$number_to_select,
                   variable_to_select = input$variable_to_select,
                   sector_to_select = input$sector_to_select)

})
}

# Run the application
shinyApp(ui = ui, server = server)
