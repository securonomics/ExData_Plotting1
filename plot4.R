# Project 1 for Coursera Course "Exploratory Data Analysis"
# R Script for Plot 4
# Author: Securonomics

# Set working directory
setwd("~/Documents/Courses/Coursera/4 - Exploratory Data Analysis")

# Read in file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE)

# Convert "Date" variable into standard data format and others into numeric formats 
# and then subset using array subsetting
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
pcDataFeb <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") , ]
pcDataFeb$Global_active_power <- as.numeric(pcDataFeb$Global_active_power)
pcDataFeb$Global_reactive_power <- as.numeric(pcDataFeb$Global_reactive_power)
pcDataFeb$Voltage <- as.numeric(pcDataFeb$Voltage)
pcDataFeb$Sub_metering_1 <- as.numeric(pcDataFeb$Sub_metering_1)
pcDataFeb$Sub_metering_2 <- as.numeric(pcDataFeb$Sub_metering_2)
pcDataFeb$Sub_metering_3 <- as.numeric(pcDataFeb$Sub_metering_3)

# Concatenate date and time columns into single array
datetime <- strptime(paste(pcDataFeb$Date, pcDataFeb$Time), format = "%Y-%m-%d %H:%M:%S")

# Creating Plot 4
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# Plot 4 - upper left
plot(datetime, pcDataFeb$Global_active_power, type="l", 
     xlab = "", ylab = "Global Active Power")

# Plot 4 - upper right
plot(datetime, pcDataFeb$Voltage, type="l", 
     ylab = "Voltage")

# Plot 4 - lower left
plot(datetime, pcDataFeb$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, pcDataFeb$Sub_metering_2, col = "red")
lines(datetime, pcDataFeb$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 - lower right
with(pcDataFeb, plot(datetime, Global_reactive_power, type="l"))

dev.off()