

power <- read.csv("/root/RStudio/Exploratory Data Analysis/Week 1/household_power_consumption.txt"
                  ,header = T, sep = ";")


power <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")


power$Global_active_power <- as.numeric(power$Global_active_power)

power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power$Time <- strptime(power$Time, format="%H:%M:%S")
power[1:1440,"Time"] <- format(power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power[1441:2880,"Time"] <- format(power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

plot(power$Time,power$Global_active_power,type="l",
     xlab="",ylab="Global Active Power", main="Global Active Power Vs Time") 

plot(power$Time,power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering", main="Energy sub-metering")
with(power,lines(Time,Sub_metering_1))
with(power,lines(Time,Sub_metering_2,col="red"))
with(power,lines(Time,Sub_metering_3,col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


par(mfrow=c(2,2))


with(power,{
  plot(power$Time,power$Global_active_power,type="l",  xlab="",ylab="Global Active Power")  
  plot(power$Time,power$Voltage, type="l",xlab="datetime",ylab="Voltage")
  plot(power$Time,power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(power,lines(Time,Sub_metering_1))
  with(power,lines(Time,Sub_metering_2,col="red"))
  with(power,lines(Time,Sub_metering_3,col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(power$Time,power$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})






