#set directory
setwd("C:/Users/583951/Documents/Coursera/JHU Data Science/4 - Exploratory Data Analysis/Week 1")

#read in data, convert date and time variables
full_data <- read.table( file = "household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
full_data$DateTime <- strptime(paste(full_data$Date, full_data$Time, sep = " "),format("%d/%m/%Y %H:%M:%S"))
full_data$Date <- as.Date(as.character(full_data$Date), format = "%d/%m/%Y")
full_data$Time <- format(strptime(as.character(full_data$Time), format = "%H:%M:%S"),"%H:%M:%S")


full_data <- full_data[full_data$Date <= "2007-02-02" & full_data$Date >= "2007-02-01",]


#construct plot
with(full_data, plot(x = DateTime, y = Sub_metering_1, type = 'l', col = "black",
                              xlab = "",ylab="Energy sub metering"))
with(full_data,lines(DateTime, Sub_metering_2, col = "red"))
with(full_data,lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",col = c("black", "red", "blue"), lty = 1,
       legend = (c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))

dev.copy(png, file = "plot3.png")

dev.off()
