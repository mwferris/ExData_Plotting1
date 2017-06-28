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
png(filename = "plot1.png")
hist(subset$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts", ylab = "Frequency")
dev.off()