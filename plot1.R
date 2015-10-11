library(dplyr)

setwd("C:/Users/e79q/Downloads/Data_Science/Coursera/exdata-033")

power_data <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
power_data$Date <- as.Date(power_data$Date, format = "%d/%m/%Y")

power_data$timetemp <- paste(power_data$Date, power_data$Time)
power_data$Time <- strptime(power_data$timetemp, format = "%Y-%m-%d %H:%M:%S")

subset_power_data <- subset(power_data, Date == "2007-02-01" | Date == "2007-02-02")

png(filename="plot1.png", width = 480, height = 480)

hist(as.numeric(as.character((subset_power_data$Global_active_power))), xlab="Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")

dev.off()