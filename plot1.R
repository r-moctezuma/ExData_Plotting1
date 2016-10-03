
# Project 1
# Plot 1
# Author: Roberto Moctezuma

hpc <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, na.strings  = "?")
hpc_extract <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
hist(hpc_extract$Global_active_power, col = 'red', main = 'Global Active Power', xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png",width = 480, height = 480)
dev.off()
