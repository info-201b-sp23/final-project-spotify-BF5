library("dplyr")
library("ggplot2")
library("plotly")
library("scales")

spotify_df <- read.csv("dataset.csv")


my_server <- function(input, output) {
  output$chart_2 <- renderPlotly({
    # Get the selected genre
    selected_genre <- input$genre_select
    
    # Filter the data based on the selected genre
    genre_data <- spotify_df %>%
      filter(track_genre == selected_genre, popularity > 30)
    
    # Generate the ggplot object
    plot <- ggplot(genre_data, aes(x = danceability, y = popularity)) +
      geom_point() +
      labs(x = "Danceability", y = "Popularity") +
      ggtitle(paste("Correlation between Danceability in", selected_genre, "and Popularity"))
    
    # Convert ggplot object to plotly
    plotly::ggplotly(plot)
  
  })
  output$chart_3 <- renderPlotly({
    avg_genre_popularity <- spotify_df %>%
      group_by(track_genre) %>%
      select(artists, track_name, track_genre, popularity) %>%
      filter(popularity > 30) %>%
      summarise(avg_popularity = mean(popularity)) %>%
      arrange(desc(avg_popularity))
    
    ggplot(avg_genre_popularity, aes(x = track_genre, y = avg_popularity, fill = track_genre)) +
      geom_col() +
      labs(title = "Average Popularity of Genres", x = "Genre", y = "Popularity", fill = "Genre")
    plotly::ggplotly(plot)
  })
}