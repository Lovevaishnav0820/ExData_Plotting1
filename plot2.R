data_full <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
data <- subset(data_full, Date == "2007-02-01" | Date == "2007-02-02")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
plot(data$Datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()