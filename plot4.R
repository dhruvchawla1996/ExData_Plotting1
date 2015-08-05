## Read the data on housing power consumption
household_power_consumption <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?")

## Convert Date column to class Date from Factor
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Subset out data from 2007-02-01 and 2007-02-02
hps_data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Convert Time to POSIXlt
hps_data$Time <- paste(hps_data$Date, hps_data$Time)
hps_data$Time <- strptime(hps_data$Time, "%Y-%m-%d %H:%M:%S")

## Open plot4.png
png("plot4.png")

## Create 2x2 multi-plot
par(mfrow = c(2,2))

## Plot 1st plot
plot(hps_data$Time, hps_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Plot 2nd plot
plot(hps_data$Time, hps_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Plot 3rd plot
with(hps_data, plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))

with(hps_data, points(Time, Sub_metering_1, col = "black", type = "l"))
with(hps_data, points(Time, Sub_metering_2, col = "red", type = "l"))
with(hps_data, points(Time, Sub_metering_3, col = "blue", type = "l"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = NA, lwd = 1, lty = 1, bty = "n")

## Plot 4th plot
plot(hps_data$Time, hps_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Finish plotting
dev.off()