# Project 1 for Coursera Course "Exploratory Data Analysis"
# Author: Securonomics

# Set working directory
setwd("~/Documents/Courses/Coursera/4 - Exploratory Data Analysis")

# Read in file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
head(data)

# Convert "Date" variable into standard data format and others into numeric formats 
# and then subset using array subsetting
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
pcDataFeb <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") , ]
pcDataFeb$Sub_metering_1 <- as.numeric(pcDataFeb$Sub_metering_1)
pcDataFeb$Sub_metering_2 <- as.numeric(pcDataFeb$Sub_metering_2)
pcDataFeb$Sub_metering_3 <- as.numeric(pcDataFeb$Sub_metering_3)
head(pcDataFeb)
dim(pcDataFeb)

# Concatenate date and time columns into single array
datetime <- strptime(paste(pcDataFeb$Date, pcDataFeb$Time), format = "%Y-%m-%d %H:%M:%S")

# Creating Plot 3
png(file="plot3.png", width=480, height=480)
plot(datetime, pcDataFeb$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(datetime, pcDataFeb$Sub_metering_2, col = "red")
lines(datetime, pcDataFeb$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()