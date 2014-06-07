library(datasets)
## File contains 9 col, and 2075259 rows, only read desired data
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), nrows = 2880, skip = 66636, na.strings=c("?","NA"))

png(filename = "plot3.png", width = 480, height = 480, units = "px") ## Opens PNG device
x <- as.POSIXct( strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S"))  
y <- powerData$Sub_metering_1
y2 <- powerData$Sub_metering_2
y3 <- powerData$Sub_metering_3

plot(x,y, type = "n", ylab = "Energy sub metering") ## empty plot 
points(x,y, type = "l", col = "black") ## add in data one colour at a time
points(x,y2, type = "l", col = "red")
points(x,y3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"), lwd = 1)
dev.off() ## close to PNG file device