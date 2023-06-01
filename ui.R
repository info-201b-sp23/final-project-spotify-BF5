library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)

spotify_df <- read.csv("dataset.csv")

my_theme <- bs_theme(bg = "black", 
                     fg = "white", 
                     primary = "lightgreen")
my_theme <- my_theme %>% bs_add_rules(sass::sass_file("style.scss"))

summary_tab <- tabPanel("Summary and Conclusion", includeMarkdown("summary.md"))

intro_tab <- tabPanel("Introduction", includeMarkdown("intro.md"))

chart1 <- tabPanel("Chart 1",
                   sidebarLayout(
                     sidebarPanel(
                       selectInput(
                         inputId = "Attribute",
                         label = "Choose Attributes to Compare to Popularity",
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
            

chart2 <- tabPanel("Chart 2",
                   sidebarLayout(
                     sidebarPanel(
                   selectInput(inputId = "genre_select", label = "Select Genres", choices = unique(spotify_df$track_genre))),
                   mainPanel(
                   plotlyOutput(outputId = "chart_2"),
                   p("The chart reveals the information about the correlation between genres' songs danceability and popularity."))
                   )
                   )

chart3 <- tabPanel("Chart 3",
                   sidebarLayout(
                     sidebarPanel(
                      selectInput(inputId = "select_genre", label = "Select Genres", choices = unique(spotify_df$track_genre), selected = "alternative", multiple = TRUE)),
                     mainPanel(
                      plotlyOutput(outputId = "chart_3"),
                      p("This shows the average popularity of your selected genres. With this graph we can see with genres are considered the most popular based on the average popularity of the songs within the genre. Showing how popular each genre is on Spotify"))
                   )
                   )



my_ui <- navbarPage("Spotify Track Popularity",
                    theme = my_theme, intro_tab, chart1, chart2, chart3,
                    summary_tab

                    
)