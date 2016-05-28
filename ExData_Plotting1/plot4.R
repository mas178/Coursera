Sys.setlocale("LC_TIME","C") # to avoid garbling due to multi byte character

# Setup Data
fileName <- "../household_power_consumption.txt"
data <- subset(
  read.table(fileName, header = TRUE, na.strings = "?", sep = ";"),
  subset = Date %in% c("1/2/2007", "2/2/2007"),
  select = c(Date, Time, Global_active_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3, Global_reactive_power))
data <- data.frame(
  datetime = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"),
  Global_active_power = as.double(data$Global_active_power),
  Voltage = as.double(data$Voltage),
  Sub_metering_1 = as.double(data$Sub_metering_1),
  Sub_metering_2 = as.double(data$Sub_metering_2),
  Sub_metering_3 = as.double(data$Sub_metering_3),
  Global_reactive_power = as.double(data$Global_reactive_power))

# calculate axis range
datetimeRange <- as.POSIXct(range(data$datetime))
datetimeAt <- seq(datetimeRange[1], datetimeRange[2] + 60 * 60 * 24, by = "day")
subMeteringRange <- range(data$Sub_metering_1)
subMeteringAt <- seq(subMeteringRange[1], subMeteringRange[2], by = 10)

# Plot Line Graph
par(mfrow = c(2, 2))
with(data, {
  plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  axis.POSIXct(1, at = datetimeAt, format = "%a")
})
with(data, {
  plot(datetime, Voltage, type = "l")
  axis.POSIXct(1, at = datetimeAt, format = "%a")
})
with(data, {
  plot(datetime, Sub_metering_1, type = "l", col = "Black", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "Red")
  lines(datetime, Sub_metering_3, col = "Blue")
  axis.POSIXct(1, at = datetimeAt, format = "%a")
  axis(2, at = subMeteringAt)
  legend("topright", lty = 1, bty = "n", cex = 0.5, col = c("Black", "Red", "Blue"),
    legend = c("Sub_metering_1        ", "Sub_metering_2        ", "Sub_metering_3        "))
})
with(data, {
  plot(datetime, Global_reactive_power, type = "l")
  axis.POSIXct(1, at = datetimeAt, format = "%a")
})

# Save Line Graph as PNG file
dev.copy(png, file = "plot4.png" , width = 480, height = 480)
dev.off()
