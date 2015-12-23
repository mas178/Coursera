library(UsingR); data(iris)

shinyServer(
  function(input, output) {
    output$plotIris = renderPlot({
      
      data = subset(iris, Species %in% input$species)
      
      irisPlot = function(x, y, xlim, ylim, main) {
        plot(x, y, col = c("red", "green3", "blue")[unclass(data$Species)], main = main, xlab = "Width", ylab = "Length")
        points(mean(x), mean(y), pch = 4, cex = 5)
      }
      
      par(mfrow = c(1, 2))
      irisPlot(data$Sepal.Width, data$Sepal.Length, main = "Sepal")
      irisPlot(data$Petal.Width, data$Petal.Length, main = "Petal")
    })
  }
)
