library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)
library(markdown)

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
                         multiple = TRUE, selected = c("popularity", "energy")
                       )
                     ),
                     mainPanel(
                       plotlyOutput("chart_1"),
                       p("The chart shows the correlation between the “popularity” 
                         and other attributes (“duration_ms”, “tempo”, “energy”, and “liveness”) of the songs in the form 
                         of a matrix. The matrix is a selection of the top 1% of all songs in the dataset.")
                     )
                   )
)
            

chart2 <- tabPanel("Chart 2",
                   sidebarLayout(
                     sidebarPanel(
                   selectInput(inputId = "genre_select", label = "Select Genres", 
                               choices = unique(spotify_df$track_genre))),
                   mainPanel(
                   plotlyOutput(outputId = "chart_2"),
                   p("The chart reveals the information about the correlation between genres' songs 
                     danceability and popularity."))
                   )
                   )

chart3 <- tabPanel("Chart 3",
                   sidebarLayout(
                     sidebarPanel(
                      selectInput(inputId = "select_genre", label = "Select Genres", 
                                  choices = unique(spotify_df$track_genre), selected = "alternative", 
                                  multiple = TRUE)),
                     mainPanel(
                      plotlyOutput(outputId = "chart_3"),
                      p("This chart shows the average popularity of your selected genres. With this graph 
                        we can see with genres are considered the most popular based on the average 
                        popularity of the songs within the genre. Showing how popular each genre is on Spotify"))
                   )
                   )



my_ui <- navbarPage("Spotify Track Popularity",
                    theme = my_theme, intro_tab, chart1, chart2, chart3,
                    summary_tab

                    
)