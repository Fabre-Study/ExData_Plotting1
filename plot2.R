############################################################################
## Plot 2
## must use - data.table library

## Read Data
library(ggplot2)
library(data.table)
Sys.setlocale("LC_TIME","C")
my.temp <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows=5)
my.classes <- sapply(my.temp, class)
my.data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = my.classes, comment.char = "", na.strings = "?")
my.data <- subset(my.data, Date == "1/2/2007" | Date == "2/2/2007")
my.data <- cbind(c(strptime(paste(my.data[,1], my.data[,2]), format="%d/%m/%Y %H:%M:%S")),my.data)
setnames(my.data, old="c(strptime(paste(my.data[, 1], my.data[, 2]), format = \"%d/%m/%Y %H:%M:%S\"))", new="DateTime")

## Plot Result in PNG file
dev.copy(png,"Plot2.png", width=480, height=480)
plot(my.data$DateTime, my.data$Global_active_power, type="l", main="", xlab="", ylab="Global Active Ppower (kilowatts)")
dev.off()

############################################################################
