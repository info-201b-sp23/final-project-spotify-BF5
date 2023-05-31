library(dplyr)
library(ggplot2)
library(plotly)
library(bslib)
install.packages("markdown")
spotify_df <- read.csv("dataset.csv")

my_theme <- bs_theme(bg = "black", 
                     fg = "white", 
                     primary = "lightgreen")
my_theme <- my_theme %>% bs_add_rules(sass::sass_file("style.scss"))

summary_tab <- tabPanel("Summary and Conclusion")

intro_tab <- tabPanel("Introduction", includeMarkdown("intro.md"))

chart1 <- tabPanel("CHART1")

chart2 <- tabPanel("CHART2",
                   selectInput(inputId = "genre_select", label = "Select Genres", choices = unique(spotify_df$track_genre)),
                   plotlyOutput(outputId = "chart_2")
                   )

chart3 <- tabPanel("CHART3",
                   sidebarLayout(
                     sidebarPanel(
                      checkboxGroupInput(inputId = "select_genre", label = "Select Genres", choices = unique(spotify_df$track_genre), selected = "alternative")),
                     mainPanel(
                      plotlyOutput(outputId = "chart_3"),
                      p("This shows the average popularity of your selected genres"))
                   )
                   )



my_ui <- navbarPage("Spotify Track Popularity",
                    theme = my_theme, intro_tab, chart1, chart2, chart3,
                    summary_tab

                    
)