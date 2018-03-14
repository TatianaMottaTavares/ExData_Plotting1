# plot 2

# read table and subset, then create a dataset combining date and time in a serie
full_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
eletro <- subset(full_set, Date == "1/2/2007"| Date == "2/2/2007")
datetime <- strptime(paste(eletro$Date, eletro$Time), "%d/%m/%Y %H:%M:%S")

# plot and save figure in png
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(datetime, eletro$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.off()


