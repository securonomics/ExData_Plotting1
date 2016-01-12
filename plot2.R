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
pcDataFeb$Global_active_power <- as.numeric(pcDataFeb$Global_active_power)
head(pcDataFeb)
dim(pcDataFeb)

# Concatenate date and time columns into single array
datetime <- strptime(paste(pcDataFeb$Date, pcDataFeb$Time), format = "%Y-%m-%d %H:%M:%S")

# Create Plot 2
png(file="plot2.png", width=480, height=480)
plot(datetime, pcDataFeb$Global_active_power, type="l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()