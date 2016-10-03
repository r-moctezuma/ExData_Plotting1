
# Project 1
# Plot 2
# Author: Roberto Moctezuma

hpc <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings  = "?")
hpc_extract <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

library(lubridate)
hpc_extract$timestamp = dmy_hms(paste(hpc_extract$Date,hpc_extract$Time))
plot(hpc_extract$timestamp, hpc_extract$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot2.png",width = 480, height = 480)
dev.off()
