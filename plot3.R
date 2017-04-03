dataFile <- "~/data_science/data/household_power_consumption.txt"
# Read data
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Format data to class
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- as.numeric(subSetData$Sub_metering_1)
subMeter2 <- as.numeric(subSetData$Sub_metering_2)
subMeter3 <- as.numeric(subSetData$Sub_metering_3)

# Build plot
png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="n", xlab="", ylab="Energy sub metering")
points(datetime, subMeter1, type='l')
points(datetime, subMeter2, type='l', col='red')
points(datetime, subMeter3, type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,1,1), col = c('black', 'red', 'blue'))
dev.off()
