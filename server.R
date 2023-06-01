library(dplyr)
library(plotly)
library(ggplot2)
library(shiny)
library(GGally)


Yes
spotify_df <- read.csv("dataset.csv")


my_server <- function(input, output) {
  
  output$chart_1 <- renderPlotly({
    
    validate(
      need(input$Attribute, "Please select at least 2 attribute")
    )
    
    # Simplify to and organize data
    spotify_df <- spotify_df %>%
      group_by(track_name, artists) %>%
      arrange(desc(popularity)) %>%
      ungroup()
    
    spotify_df <- spotify_df %>%
      distinct(track_name, artists, .keep_all = TRUE, .keep_last = FALSE)
    
    # Extract the top 1% of popular songs
    top_songs <- spotify_df %>%
      slice(1:ceiling(0.01 * nrow(spotify_df)))
    
    # Find the averages of all the numeric values in the df
    averages <- top_songs %>%
      summarize(across(where(is.numeric), mean, na.rm = TRUE))
  
    
    # Create the scatter plot matrix with colored points
    attributes <- input$Attribute
    
    if (length(attributes) > 1) {
      scatterplot_matrix <- ggpairs(top_songs, columns = attributes, 
                                    lower = list(continuous = wrap("points", alpha = 0.7)))
    } else {
      scatterplot_matrix <- NULL
    }
    
    # Convert GGally plot object to plotly
    if (!is.null(scatterplot_matrix)) {
      ggplotly(scatterplot_matrix)
    }
    
  })
  
  
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
      filter(popularity > 1) %>%
      filter(track_genre == input$select_genre) %>%
      summarise(avg_popularity = mean(popularity)) %>%
      arrange(desc(avg_popularity))
    
    plot <- ggplot(avg_genre_popularity, aes(x = track_genre, y = avg_popularity, fill = track_genre)) +
      geom_col() +
      labs(title = "Average Popularity of Genres", x = "Genres", y = "Popularity", fill = "Genre")
    
    ggplotly(plot)
  })
  
}