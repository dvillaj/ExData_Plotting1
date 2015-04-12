Sys.setlocale("LC_TIME", "English") 
data <- read.table("household_power_consumption.txt", sep = ";" ,  na.strings = "?", header = TRUE)
#data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[data$Date == as.Date("20070201", "%Y%m%d") | data$Date == as.Date("20070202", "%Y%m%d") , ]

png(file="plot1.png", width = 480 , height = 480 )
hist(data2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
