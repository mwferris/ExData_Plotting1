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
png("plot4.png")
par(mfcol = c(2,2)) # we want 4 charts, 2x2

## chart (1, 1)
plot(subset$Global_active_power ~ subset$datetime, 
     pch = NA, ylab = "Global Active Power (kilowatts)", xlab = "")
lines(subset$Global_active_power ~ subset$datetime)

## chart (2, 1)
plot(subset$Sub_metering_1 ~ subset$datetime, pch = NA, ylab = "Energy sub metering", xlab = "")
lines(subset$Sub_metering_1 ~ subset$datetime)
lines(subset$Sub_metering_2 ~ subset$datetime, col = "red")
lines(subset$Sub_metering_3 ~ subset$datetime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1,bty = "n" )

## chart (1, 2)
plot(subset$Voltage ~ subset$datetime, pch = NA, ylab = "Voltage", xlab = "datetime")
lines(subset$Voltage ~ subset$datetime)

## chart (2, 2)
plot(subset$Global_reactive_power ~ subset$datetime, pch = NA, ylab = "Global_reactive_power", 
     xlab = "datetime")
lines(subset$Global_reactive_power ~ subset$datetime)

dev.off()