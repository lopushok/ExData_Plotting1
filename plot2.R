data <- read.table("household_power_consumption.txt", header = T, sep = ";") # read data
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # subsetting two days

data2[, 2] <- as.character(data2[, 2])
data2[, 1] <- as.character(data2[, 1])
data2[, 2] <- paste(data2[, 1], data2[, 2]) # merging date & time

library("lubridate")
data2[, 2] <- dmy_hms(data2[, 2]) # from character to POSIXct

data2[, 3] <- as.numeric(levels(data2[, 3])[data2[, 3]]) #from factor to numeric

png("plot2.png") #create a file for the plot
plot(data2[,2], data2[ ,3], type="l", ylab="Global active power (kilowatts)", xlab=" ")
dev.off()