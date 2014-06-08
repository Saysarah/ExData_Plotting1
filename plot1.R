library(datasets)
## File contains 9 col, and 2075259 rows, only read desired data
powerData <- read.table("household_power_consumption.txt",
                        header = TRUE, sep = ";", col.names = c("Date", "Time",
                        "Global_active_power", "Global_reactive_power", "Voltage",
                        "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3"), nrows = 2880, skip = 66636,
                        na.strings=c("?","NA"))

png(file = "plot1.png", width = 480, height = 480, units = "px") ## Opens PNG device
# create plot and send it to file
x <- powerData$Global_active_power
hist(x, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off() ## close to PNG file device

