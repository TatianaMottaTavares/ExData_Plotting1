#### plot 4 ####

# read table and subset, then create a dataset combining date and time in a serie
full_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
eletro <- subset(full_set, Date == "1/2/2007"| Date == "2/2/2007")
datetime <- strptime(paste(eletro$Date, eletro$Time), "%d/%m/%Y %H:%M:%S")

#prepare to save figure in png, and set to plot four different graphs
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))

#plot 2
plot(datetime, eletro$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = " ")

#plot 3
plot(datetime, eletro[,7], type = "l",
     ylab = "Energy sub metering", xlab = " ")
lines(datetime, eletro[,8], col = 'red')
lines(datetime, eletro[,9], col = 'blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(eletro[,7:9]))

#plot Voltage
plot(datetime, eletro$Voltage, type = "l", ylab = "Voltage")

#plot Global reactive power
plot(datetime, eletro$Global_reactive_power, type = "l")
dev.off()


