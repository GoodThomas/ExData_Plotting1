# Load packages

library(data.table)
library(lubridate)

# Load data

household_power_consumption <- fread("./household_power_consumption.txt", na.strings = "?")
household_power_consumption <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Constructs the plot

household_power_consumption$date_time <- dmy_hms(paste(household_power_consumption$Date, household_power_consumption$Time))

par(mfrow = c(1,1))

plot(household_power_consumption$date_time, household_power_consumption$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
