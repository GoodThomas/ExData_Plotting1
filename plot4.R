# Load packages

library(data.table)
library(lubridate)

# Load data

household_power_consumption <- fread("./household_power_consumption.txt", na.strings = "?")
household_power_consumption <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Constructs the plot

household_power_consumption$date_time <- dmy_hms(paste(household_power_consumption$Date, household_power_consumption$Time))

par(mfrow = c(2,2))

plot(household_power_consumption$date_time, household_power_consumption$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")

plot(household_power_consumption$date_time, household_power_consumption$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")

plot(household_power_consumption$date_time, household_power_consumption$Sub_metering_1, type = 'l', col = "black", xlab = "", ylab = "Energy sub metering")
lines(household_power_consumption$date_time, household_power_consumption$Sub_metering_2, col = "red")
lines(household_power_consumption$date_time, household_power_consumption$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.6)

plot(household_power_consumption$date_time, household_power_consumption$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
