Sys.setlocale("LC_TIME", "English") 
data <- read.table("household_power_consumption.txt", sep = ";" ,  na.strings = "?", header = TRUE)
#data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[data$Date == as.Date("20070201", "%Y%m%d") | data$Date == as.Date("20070202", "%Y%m%d") , ]

data2$DateTime <- strptime(paste(as.character(data2$Date, "%d/%m/%Y"), data2$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width = 480 , height = 480 )

par(mfrow=c(2,2))

plot(data2$DateTime, data2$Global_active_power,  type="l", xlab = "", ylab = "Global Active Power")
plot(data2$DateTime, data2$Voltage,  type="l", xlab = "datetime", ylab = "Voltage")

plot(data2$DateTime, data2$Sub_metering_1,  type="l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")

legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty=c(1,1,1), bty = "n")

plot(data2$DateTime, data2$Global_reactive_power,  type="l", xlab = "", ylab = "Global_reactive_power")

dev.off()
