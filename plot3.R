# Project 1
# Plot 3
# Author: Roberto Moctezuma

hpc <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings  = "?")
hpc_extract <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

library(lubridate)
hpc_extract$timestamp = dmy_hms(paste(hpc_extract$Date,hpc_extract$Time))

quartz(width=6, height=6, bg = "white", dpi= 80)
plot(hpc_extract$timestamp, hpc_extract$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(hpc_extract$timestamp, hpc_extract$Sub_metering_2, col = 'red')
lines(hpc_extract$timestamp, hpc_extract$Sub_metering_3, col = 'blue')
legend("topright", lwd = 1, col = c('black','red','blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.copy(png,file = "plot3.png",width = 480, height = 480)
dev.off()