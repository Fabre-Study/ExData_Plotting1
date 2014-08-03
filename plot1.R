############################################################################
## Plot 1

## Read Data
library(data.table)
my.temp <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows=5)
my.classes <- sapply(my.temp, class)
my.data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = my.classes, comment.char = "", na.strings = "?")
my.data <- subset(my.data, Date == "1/2/2007" | Date == "2/2/2007")

## Plot Result in PNG file
dev.copy(png, "Plot1.png", width=480, height=480)
hist(my.data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

############################################################################
