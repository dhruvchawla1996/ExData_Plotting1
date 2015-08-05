## Read the data on housing power consumption
household_power_consumption <- read.csv("../household_power_consumption.txt", sep = ";", na.strings = "?")

## Convert Date column to class Date from Factor
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Subset out data from 2007-02-01 and 2007-02-02
hps_data <- subset(household_power_consumption, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Open plot1.png
png("plot1.png")

## Plot
hist(hps_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power", ylab = "Frequency")

## Finish plotting
dev.off()