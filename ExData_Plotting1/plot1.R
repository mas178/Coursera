# Setup Data of "Global Active Power"
fileName <- "../household_power_consumption.txt"
data <- subset(
  read.table(fileName, header = TRUE, na.strings = "?", sep = ";"),
  subset = Date %in% c("1/2/2007", "2/2/2007"),
  select = c(Global_active_power))
data <- as.double(unlist(data))

# Plot Histogram
hist(
  data,
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  col = "Red")

# Save Histogram as PNG file
dev.copy(png, file = "plot1.png" , width = 480, height = 480)
dev.off()