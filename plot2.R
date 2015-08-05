## Read the data on housing power consumption
household_power_consumption <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?")

## Convert Date column to class Date from Factor
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Subset out data from 2007-02-01 and 2007-02-02
hps_data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Convert Time to POSIXlt
hps_data$Time <- paste(hps_data$Date, hps_data$Time)
hps_data$Time <- strptime(hps_data$Time, "%Y-%m-%d %H:%M:%S")

## Open plot2.png
png("plot2.png")

## Plot
plot(hps_data$Time, hps_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

## Finish plotting
dev.off()