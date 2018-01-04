# Load packages

library(data.table)

# Load data

household_power_consumption <- fread("./household_power_consumption.txt", na.strings = "?")
household_power_consumption <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")

# Constructs the plot

par(mfrow = c(1,1))
hist(household_power_consumption$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
