## reads in household power data and generates a plot to file
## assumes data file is located at ./data/household_power_consumption.txt

## read in data
data <- read.table("./data/household_power_consumption.txt", header = TRUE,
                   sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## get data for the 2 days we are interested in 
subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

## plot to file
png("plot3.png")
plot(subset$Sub_metering_1 ~ subset$datetime, pch = NA, ylab = "Energy sub metering", xlab = "")
lines(subset$Sub_metering_1 ~ subset$datetime)
lines(subset$Sub_metering_2 ~ subset$datetime, col = "red")
lines(subset$Sub_metering_3 ~ subset$datetime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()