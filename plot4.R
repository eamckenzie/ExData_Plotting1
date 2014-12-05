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

## Plot 4: Create the four-part figure,
## and save it as a .PNG file.
png(filename="plot4.png")
par(mfrow=c(2,2))
with(power, {
  plot(x=Time, y=Global_active_power, ylab="Global Active Power", 
       type="l", xlab= "")
  plot(x=Time, y=Voltage, type="l", xlab= "datetime")  
  plot(x=Time, y=Sub_metering_1, ylab="Energy sub metering", 
       type="l", xlab= "")
  lines(x=Time, y=Sub_metering_2, type="l", col="red")
  lines(x=Time, y=Sub_metering_3, type="l", col="blue")
  legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", 
           "Sub_metering_3"), lty=1, col=c("black","red","blue"))
  plot(x=Time, y=Global_reactive_power, type="l", xlab= "datetime")
  })
dev.off()






