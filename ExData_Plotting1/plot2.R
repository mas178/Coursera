# Setup Data of "Global Active Power"
fileName <- "../household_power_consumption.txt"
data <- subset(
  read.table(fileName, header = TRUE, na.strings = "?", sep = ";"),
  subset = Date %in% c("1/2/2007", "2/2/2007"),
  select = c(Date, Time, Global_active_power))
data <- data.frame(
  Date = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"),
  Global_active_power = as.double(data$Global_active_power))

# Plot Line Graph
plot(
  data,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)")
Sys.setlocale("LC_TIME","C")
r <- as.POSIXct(range(data$Date))
axis.POSIXct(1, at = seq(r[1], r[2] + 60 * 60 * 24, by = "day"), format = "%a")

# Save Line Graph as PNG file
dev.copy(png, file = "plot2.png" , width = 480, height = 480)
dev.off()

