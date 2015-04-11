data <- read.table("household_power_consumption.txt", header = T, sep = ";") # read data
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # subsetting two days

data2[, 2] <- as.character(data2[, 2])
data2[, 1] <- as.character(data2[, 1])
data2[, 2] <- paste(data2[, 1], data2[, 2]) # merging date & time

library("lubridate")
data2[, 2] <- dmy_hms(data2[, 2]) # from character to POSIXct

data2[, 7] <- as.numeric(levels(data2[, 7])[data2[, 7]]) #from factor to numeric
data2[, 8] <- as.numeric(levels(data2[, 8])[data2[, 8]])
data2[, 5] <- as.numeric(levels(data2[, 5])[data2[, 5]])
data2[, 3] <- as.numeric(levels(data2[, 3])[data2[, 3]])
data2[, 4] <- as.numeric(levels(data2[, 4])[data2[, 4]])

png("plot4.png") #create a file for the plot
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data2, plot(data2[,2], data2[ ,3], type="l", ylab="Global active power (kilowatts)", xlab=" "))
with(data2, plot(data2[,2], data2[ ,5], type="l", ylab="Voltage", xlab="datetime"))
with(data2, {plot(data2[, 2], data2[, 7], type="l", xlab=" ", ylab="Energy sub metering")
            lines(data2[, 2], data2[, 8], type="l", col="red")
            lines(data2[, 2], data2[, 9], type="l", col="blue")
            legend("topright", bty="n", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))})
with(data2, plot(data2[,2], data2[ ,4], type="l", ylab="Global_reactive_power", xlab="datetime"))
dev.off()