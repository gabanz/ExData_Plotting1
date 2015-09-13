# plot2.R

setwd("/Users/faiz/Documents/R/data")

data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

newdata <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot2.png", height=480, width=480)

plot(newdata$DateTime, newdata$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()