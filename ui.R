library("dplyr")
library("ggplot2")
library("plotly")
library(bslib)

spotify_df <- read.csv("dataset.csv")

my_theme <- bs_theme(bg = "white", 
                     fg = "black", 
                     primary = "brown")
my_theme %>% bs_add_rules(sass::sass_file("style.css"))

summary_tab <- tabPanel("Summary and Conclusion")

intro_tab <- tabPanel("Introduction", includeMarkdown("intro.md"))

chart1 <- tabPanel("CHART1")

chart2 <- tabPanel("CHART2")

chart3 <- tabPanel("CHART3")



my_ui <- navbarPage("Spotify Track Popularity",
                    theme = my_theme, intro_tab, chart1, chart2, chart3,
                    summary_tab,

                    
)