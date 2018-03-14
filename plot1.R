# plot 1

# read table and subset

full_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
eletro <- subset(full_set, Date == "1/2/2007"| Date == "2/2/2007")

# plot and save figure in png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(eletro$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

