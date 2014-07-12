############################################################################
## Plot 3
## must use - data.table library

## Read Data
my.temp <- read.table("household_power_consumption.txt", header = TRUE, sep=";", nrows=5)
my.classes <- sapply(my.temp, class)
my.data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = my.classes, comment.char = "", na.strings = "?")
my.data <- subset(my.data, Date == "1/2/2007" | Date == "2/2/2007")
my.data <- cbind(c(strptime(paste(my.data[,1], my.data[,2]), format="%d/%m/%Y %H:%M:%S")),my.data)
setnames(my.data, old="c(strptime(paste(my.data[, 1], my.data[, 2]), format = \"%d/%m/%Y %H:%M:%S\"))", new="DateTime")

## Plot Result in PNG file
dev.copy(png,"Plot3.png", width=480, height=480)
plot(my.data$DateTime, my.data$Sub_metering_1, type="l", col="Black", main="", xlab="", ylab="Energy sub metering")
lines(my.data$DateTime, my.data$Sub_metering_2, type="l", col="Red")
lines(my.data$DateTime, my.data$Sub_metering_3, type="l", col="Blue")
legend("topright","", pch="-", col=c("Black","Red","Blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

############################################################################
