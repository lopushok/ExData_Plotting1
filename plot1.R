data <- read.table("household_power_consumption.txt", header = T, sep = ";") # read data
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # subsetting two days


data2[, 3] <- as.numeric(levels(data2[, 3])[data2[, 3]]) #from factor to numeric

png("plot1.png")    # create a file for the plot
hist(data2[ ,3], col="red", xlab="Global active power (kilowatts)", main="Global active power")
dev.off()
