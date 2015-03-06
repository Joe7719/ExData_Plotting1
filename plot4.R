setwd("C:\\Users\\Joe\\_LEARNING_todo\\___Data Science\\4 Exploratory Data Analysis\\Course Project 1\\ExData_Plotting1\\")
dataSet <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
subdataSet <- subset(dataSet,(dataSet$Date == "1/2/2007"|dataSet$Date == "2/2/2007"))
library(datasets)
subdataSet$tempGlobal_active_Power <- as.numeric(as.character(subdataSet$Global_active_power))

subdataSet$DateTime <- as.POSIXct(paste(subdataSet$Date, subdataSet$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2), pty="m", mar=c(4,4,1,1))
with(subdataSet, {
  plot(DateTime,tempGlobal_active_Power, type="l", xlab="", ylab="Global Active Power")
  plot(DateTime,as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")
  plot(DateTime,as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering")
  legend("topright",pch="____", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  lines(DateTime,as.numeric(as.character(Sub_metering_3)), col="blue", type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime,as.numeric(as.character(Sub_metering_2)), col="red", type="l", xlab="", ylab="Energy sub metering")
  plot(DateTime,as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power", ylim=c(0,0.5))
})

##dev.copy(png, file = "plot4.png")
dev.off()