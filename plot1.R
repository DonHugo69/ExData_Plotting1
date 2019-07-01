## Import data
df <- read.csv(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
## Subset data
df <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
## Create proper date column
df$Date_Time <- as.POSIXct(paste(df$Date, df$Time), tryFormats = c("%d/%m/%Y %H:%M:%S"))
## Drop old Date and Time columns
df <- df[c(-1, -2)]

## Plot 1
png("plot1.png")
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
