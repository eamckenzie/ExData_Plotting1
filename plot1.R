## First, go to your working directory.
## Then run this code to load the relevant lines from the file.
power <- read.csv("household_power_consumption.txt", 
                  header=FALSE, sep=";" , na.strings="?", 
                  skip=66636, nrows=(69519-66636))

## Format and check the dataframe.
colnames(power) <- c("Date", "Time", "Global_active_power", 
                     "Global_reactive_power","Voltage", 
                     "Global_intensity", "Sub_metering_1", 
                     "Sub_metering_2", "Sub_metering_3")

#power$Time <- strptime(power$Time, format="%X")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(paste(power$Date, power$Time), 
                       "%Y-%m-%d %H:%M:%S")
str(power)

## Plot 1: Create the Global Active Power histogram,
## and save it as a .PNG file.
png(filename="plot1.png")
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="red")
dev.off()
