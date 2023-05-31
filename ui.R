library("dplyr")
library("ggplot2")
library("plotly")
library(bslib)

spotify_df <- read.csv("dataset.csv")

my_theme <- bs_theme(bg = "black", 
                     fg = "white", 
                     primary = "lightgreen")
my_theme <- my_theme %>% bs_add_rules(sass::sass_file("style.scss"))

summary_tab <- tabPanel("Summary and Conclusion")

intro_tab <- tabPanel("Introduction", includeMarkdown("intro.md"))

chart1 <- tabPanel("CHART 1",
                   sidebarLayout(
                     sidebarPanel(
                       selectInput(
                         inputId = "Attribute",
                         label = "Choose Attributes to Compare",
                         choices = unique(c("popularity", "duration_ms", "tempo", "energy", "liveness")),
                         multiple = TRUE
                       )
                     ),
                     mainPanel(
                       plotlyOutput("chart_1"),
                       p("The purpose of including this chart was to be able to see a visual representation of each country's, as well as continent's, total amount of CO2 produced per year, with the looming threat of climate change that has been very relevant in recent years. Widgets in the chart include having the ability to change the country and compare multiple countries across each other, as well as changing the starting date for the graph, starting from 1930 all the way to 2021. Some patterns I saw emerge were, in each country's own graph, there seems to be a significant increase in the total amount of CO2 produced each year starting from the 1930s, with most countries seeming to have peaked during the 1980s. While some countries did increase as the years pass going into the 2000s, some countries have dipped in the total amount of CO2 produced within the year, which showcases how some countries are willing to reduce using materials that can cause CO2 emission in order to reduce the effects of climate change.")
                     )
                   )
)
            

chart2 <- tabPanel("CHART2",
                   selectInput(inputId = "genre_select", label = "Select Genre:", choices = unique(spotify_df$track_genre)),
                   plotlyOutput(outputId = "chart_2")
                   )

chart3 <- tabPanel("CHART3",
                   checkboxInput(label = "Select Genres", choices = unique(spotify_df$track_genre), value = FALSE), 
                   plotlyOutput(outputId = "chart_3"))



my_ui <- navbarPage("Spotify Track Popularity",
                    theme = my_theme, intro_tab, chart1, chart2, chart3,
                    summary_tab

                    
)