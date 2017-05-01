#set directory
setwd("C:/Users/583951/Documents/Coursera/JHU Data Science/4 - Exploratory Data Analysis/Week 1")

#read in data, convert date and time variables
full_data <- read.table( file = "household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
full_data$DateTime <- strptime(paste(full_data$Date, full_data$Time, sep = " "),format("%d/%m/%Y %H:%M:%S"))
full_data$Date <- as.Date(as.character(full_data$Date), format = "%d/%m/%Y")
full_data$Time <- format(strptime(as.character(full_data$Time), format = "%H:%M:%S"),"%H:%M:%S")

full_data <- full_data[full_data$Date <= "2007-02-02" & full_data$Date >= "2007-02-01",]


#construct plot
with(full_data, hist(x = Global_active_power, freq = T, col = "red",
                              main = "Global Active Power", xlab="Global Active Power(kilowatts)",ylab = "Frequency"))
dev.copy(png, file = "plot1.png")

dev.off()
