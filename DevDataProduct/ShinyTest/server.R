library(UsingR)
data(iris)

shinyServer(
  function(input, output) {
    output$plotIris <- renderPlot({
      data = subset(iris, Species %in% input$species)

      par(mfrow=c(1,2))

      plot(
        data$Sepal.Width, data$Sepal.Length,
        xlim = c(1.8, 4.6), ylim = c(4, 8), col = c("red", "green3", "blue")[unclass(data$Species)],
        main = "Sepal", xlab = "Width", ylab = "Length")
      points(mean(data$Sepal.Width), mean(data$Sepal.Length), pch = 4, cex = 5)
      
      plot(
        data$Petal.Width, data$Petal.Length,
        xlim = c(0, 2.6), ylim = c(0, 7), col = c("red", "green3", "blue")[unclass(data$Species)],
        main = "Petal", xlab = "Width", ylab = "Length")
      points(mean(data$Petal.Width), mean(data$Petal.Length), pch = 4, cex = 5)
    })
  }
)
