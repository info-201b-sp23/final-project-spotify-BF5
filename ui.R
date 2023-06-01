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
                         label = "Choose Attributes to Compare",
                         choices = unique(c("popularity", "duration_ms", "tempo", "energy", "liveness")),
                         multiple = TRUE
                       ), 
                       
                       p("", strong("Averages"), ""),
                       
                       p("Duration in ms:", (averages$duration_ms), ""),
                           
                       p("Tempo: ", (averages$tempo), ""),
                           
                       p("Energy: ", (averages$energy), ""),

                       p("Liveness: ", (averages$liveness), "")
                     ),
                     mainPanel(
                       plotlyOutput("chart_1"),
                       p("When first starting this chart, we used the whole dataset which was overwhelming to look at as a scatterplot and looked like a black square, so that meant there was no correlations between popularity and other attributes. So, we cut the dataset to the 1% of most popular songs. This is a matrix of the top 1% of the most popular songs and their attributes. The matrix shows the correlation between the popularity and other attributes (duration_ms, tempo, energy, and liveness) of the songs. Each point in the scatter plot represents a song, and the color of the point indicates if the point is above or below the median popularity. While this is a correlation chart, there are no correlations between popularity and the different attributes, but you can see a pattern emerge, the most popular songs do have things in common as they begin to cluster up as seen in the charts. To track popularity easily, green is the most popular things and black is less popular. Interesting enough, the averages of the most popular songs are close to where the most popular songs of the 1% are around.")
                     )
                   )
)
            

chart2 <- tabPanel("Chart 2",
                   selectInput(inputId = "genre_select", label = "Select Genres", choices = unique(spotify_df$track_genre)),
                   plotlyOutput(outputId = "chart_2")
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