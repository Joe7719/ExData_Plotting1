setwd("C:\\Users\\Joe\\_LEARNING_todo\\___Data Science\\4 Exploratory Data Analysis\\Course Project 1\\ExData_Plotting1\\")
dataSet <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
subdataSet <- subset(dataSet,(dataSet$Date == "1/2/2007"|dataSet$Date == "2/2/2007"))
library(datasets)
subdataSet$tempGlobal_active_Power <- as.numeric(as.character(subdataSet$Global_active_power))
subdataSet$DateTime <- as.POSIXct(paste(subdataSet$Date, subdataSet$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png",width = 480, height = 480, units = "px")

par(mfrow=c(1,1))
plot(subdataSet$DateTime,subdataSet$tempGlobal_active_Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

