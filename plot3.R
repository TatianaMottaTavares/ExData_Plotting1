# plot 3

# read table and subset, then create a dataset combining date and time in a serie
full_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
eletro <- subset(full_set, Date == "1/2/2007"| Date == "2/2/2007")
datetime <- strptime(paste(eletro$Date, eletro$Time), "%d/%m/%Y %H:%M:%S")

# plot three different datasets with different colours, create a legend to the figure,
#and save figure in png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(datetime, eletro[,7], type = "l",
     ylab = "Energy sub metering", xlab = " ")
lines(datetime, eletro[,8], col = 'red')
lines(datetime, eletro[,9], col = 'blue')
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(eletro[,7:9]))
dev.off()

