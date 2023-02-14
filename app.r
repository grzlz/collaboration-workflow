library(shiny)

ui <- fluidPage(
    titlePanel("Predictor del INPC"),
    sidebarLayout(
        sidebarPanel(
          "Aqui van los inputs.",
          "Creo que tiene que ver con commits y no tanto con el texto del codigo. 
          Es numerico. Tu tienes que poner uno del tipo slider",
          numericInput(inputId = "ex", label = "Selecciona meses", value = 0, min = 0, max = 6)
        ),
        mainPanel(
          "Aqui van las graficas y las tablas"
        )
    )
)

server <- function(input, output) {
  # Aqui van las funciones y los outputs reaccionando a los inputs

}

shinyApp(ui, server)
