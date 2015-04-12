Sys.setlocale("LC_TIME", "English") 

data <- read.table("household_power_consumption.txt", sep = ";" ,  na.strings = "?", header = TRUE)
#data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[data$Date == as.Date("20070201", "%Y%m%d") | data$Date == as.Date("20070202", "%Y%m%d") , ]

data2$DateTime <- strptime(paste(as.character(data2$Date, "%d/%m/%Y"), data2$Time), "%d/%m/%Y %H:%M:%S")


png(file="plot2.png", width = 480 , height = 480 )
plot(data2$DateTime, data2$Global_active_power,  type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
