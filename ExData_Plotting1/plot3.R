Sys.setlocale("LC_TIME","C") # to avoid garbling due to multi byte character

# Setup Data of "Energy sub metering"
fileName <- "../household_power_consumption.txt"
data <- subset(
  read.table(fileName, header = TRUE, na.strings = "?", sep = ";"),
  subset = Date %in% c("1/2/2007", "2/2/2007"),
  select = c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))
data <- data.frame(
  Date = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"),
  Sub_metering_1 = as.double(data$Sub_metering_1),
  Sub_metering_2 = as.double(data$Sub_metering_2),
  Sub_metering_3 = as.double(data$Sub_metering_3))

# Plot Line Graph
plot(
  data$Date,
  data$Sub_metering_1,
  type = "l",
  col = "Black",
  axes = FALSE,
  xlab = "",
  ylab = "Energy sub metering")
lines(data$Date, data$Sub_metering_2, col = "Red")
lines(data$Date, data$Sub_metering_3, col = "Blue")

# Set axis
r <- as.POSIXct(range(data$Date))
axis.POSIXct(1, at = seq(r[1], r[2] + 60 * 60 * 24, by = "day"), format = "%a")
r <- range(data$Sub_metering_1)
axis(2, at = seq(r[1], r[2], by = 10))

# Set legend
legend(
  "topright", lty = 1, cex = 0.7,
  col = c("Black", "Red", "Blue"),
  legend = c("Sub_metering_1        ", "Sub_metering_2        ", "Sub_metering_3        "))

# Save Line Graph as PNG file
dev.copy(png, file = "plot3.png" , width = 480, height = 480)
dev.off()
