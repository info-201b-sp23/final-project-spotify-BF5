# install.packages("shiny")
library(shiny)
source("ui.R")
source("server.R")


# Runs the application (both ui and server)
shinyApp(ui = my_ui, server = my_server)
