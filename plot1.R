# Project 1 for Coursera Course "Exploratory Data Analysis"
# R Script for Plot 1
# Author: Securonomics

# Set working directory
setwd("~/Documents/Courses/Coursera/4 - Exploratory Data Analysis")

# Read in file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Convert "Date" variable into standard data format and others into numeric formats 
# and then subset using array subsetting
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
pcDataFeb <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02") , ]
pcDataFeb$Global_active_power <- as.numeric(pcDataFeb$Global_active_power)

# Create Plot 1
png(file="plot1.png", width=480, height=480)
hist(pcDataFeb$Global_active_power, main = "Global Active Power", col = "red", 
      xlab  ="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
