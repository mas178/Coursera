library(shiny)
shinyUI(fluidPage(
  verticalLayout(
    h1('IRIS Plot'),
    
    h2('ReadMe'),
    p('This is just a sample shiny application. I don\'t mean anything serious. '),
    p('You can see scatter diagrams of iris which you select in "Control".'),
    p('Black "X" in the diagrams are the mean of the data.'),
    
    h2('Control'),
    checkboxGroupInput(
      "species",
      "Species",
      c("Setosa (Red)" = "setosa", "Versicolor (Green)" = "versicolor", "Virginica (Blue)" = "virginica"),
      selected = c("setosa", "versicolor", "virginica"),
      inline = F,
      width = "100%"),
    
    h2('Output'),
    p('Please wait momentarily until the diagrams are displayed.'),
    plotOutput('plotIris')
  )
))
