# plot3.R

setwd("/Users/faiz/Documents/R/data")

data <- read.table('household_power_consumption.txt', sep=';', header=TRUE, colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings='?')

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

newdata <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

png("plot3.png", height=480, width=480)

plot(newdata$DateTime, newdata$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")

lines(newdata$DateTime, newdata$Sub_metering_2, col='red')
lines(newdata$DateTime, newdata$Sub_metering_3, col='blue')

legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))

dev.off()