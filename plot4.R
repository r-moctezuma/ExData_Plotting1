# Project 1
# Plot 4
# Author: Roberto Moctezuma

hpc <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings  = "?")
hpc_extract <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

library(lubridate)
hpc_extract$timestamp = dmy_hms(paste(hpc_extract$Date,hpc_extract$Time))

quartz(width=6, height=6, bg = "white", dpi= 80)
par(mfrow = c(2,2), oma = c(0,1,0,1))
# Plot 1
plot(hpc_extract$timestamp, hpc_extract$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# Plot 2
plot(hpc_extract$timestamp, hpc_extract$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Plot 3
plot(hpc_extract$timestamp, hpc_extract$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(hpc_extract$timestamp, hpc_extract$Sub_metering_2, col = 'red')
lines(hpc_extract$timestamp, hpc_extract$Sub_metering_3, col = 'blue')
legend("topright", lwd = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
# Plot 4
plot(hpc_extract$timestamp, hpc_extract$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,file = "plot4.png",width = 480, height = 480)
dev.off()