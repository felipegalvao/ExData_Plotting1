library(dplyr)

setwd("C:/Users/e79q/Downloads/Data_Science/Coursera/exdata-033")

power_data <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

power_data$timetemp <- paste(power_data$Date, power_data$Time)
power_data$Time <- strptime(power_data$timetemp, format = "%Y-%m-%d %H:%M:%S")

subset_power_data <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename="plot4.png", width = 480, height = 480)

par(mfrow= c(2,2))

with(subset_power_data, plot(Time, Global_active_power, type="l", 
                             ylab="Global Active Power", xlab=""))

with(subset_power_data, plot(Time, Voltage, type="l", 
                             ylab="Voltage", xlab="datetime"))

with(subset_power_data, plot(Time, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering"))
with(subset_power_data, lines(Time, Sub_metering_2, col="red"))
with(subset_power_data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", col = c("black","red","blue"), lty = c(1,1,1),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(subset_power_data, plot(Time, Global_reactive_power, type="l", 
                             ylab="Voltage", xlab="datetime"))

dev.off()