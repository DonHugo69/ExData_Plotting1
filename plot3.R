## Import data
df <- read.csv(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## Subset data
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
## Create proper date column
df$Date_Time <- as.POSIXct(paste(df$Date, df$Time), tryFormats = c("%d/%m/%Y %H:%M:%S"))
## Drop old Date and Time columns
df <- df[c(-1, -2)]

## Plot 3
png("plot3.png")
plot(df$Date_Time, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$Date_Time, df$Sub_metering_2, col = "red")
lines(df$Date_Time, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
