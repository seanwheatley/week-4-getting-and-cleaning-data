#set directory
setwd("C:/Users/583951/Documents/Coursera/JHU Data Science/4 - Exploratory Data Analysis/Week 1")

#read in data, convert date and time variables
full_data <- read.table( file = "household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
full_data$DateTime <- strptime(paste(full_data$Date, full_data$Time, sep = " "),format("%d/%m/%Y %H:%M:%S"))
full_data$Date <- as.Date(as.character(full_data$Date), format = "%d/%m/%Y")
full_data$Time <- format(strptime(as.character(full_data$Time), format = "%H:%M:%S"),"%H:%M:%S")


full_data <- full_data[full_data$Date <= "2007-02-02" & full_data$Date >= "2007-02-01",]


#construct plots
par(mfrow = c(2,2), mar=c(4,4,2,2))
attach(full_data)
plot(x = DateTime, y = Global_active_power, type = 'l', 
     xlab = "",ylab="Global Active Power")
plot(x = DateTime, y = Voltage, type = 'l', 
     xlab = "datetime",ylab="Voltage")
plot(x = DateTime, y = Sub_metering_1, type = 'l', col = "black",
                     xlab = "",ylab="Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright",col = c("black", "red", "blue"), lty = 1, bty = "n", cex = .5,
       legend = (c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))
plot(x = DateTime, y = Global_reactive_power, type = 'l', 
     xlab = "datetime",ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png")

dev.off()
