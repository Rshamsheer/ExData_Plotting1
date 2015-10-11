plot4<- function()
{
  hcdread <- read.table("household_power_consumption.txt",header=T, sep=";",na.strings=c("?"))
  hcdread$Date <- as.Date(hcdread$Date, format = "%d/%m/%Y")
  hcdread$Temp <- paste(hcdread$Date,hcdread$Time)
  hcdread$Time <- strptime(hcdread$Temp,format = "%Y-%m-%d %H:%M:%S")
  
  hcdread1<- hcdread[hcdread$Date == "2007-02-01",]
  hcdread2<- hcdread[hcdread$Date == "2007-02-02",]
  hcdread3<- merge(hcdread1,hcdread2, all=TRUE)
  par(mfcol = c(2,2))
  
  with(hcdread3,{
    
  plot(hcdread3$Time,hcdread3$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)", main="")
  
  
  plot(hcdread3$Time,hcdread3$Sub_metering_1, type="l",xlab = "", ylab = "Global Active Power (kilowatts)", main="")
  lines(hcdread3$Time,hcdread3$Sub_metering_2,col="red")
  lines(hcdread3$Time,hcdread3$Sub_metering_3,col="blue")
  legend("topright",lty=1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.50)
  
  plot(hcdread3$Time,hcdread3$Voltage, type="l",xlab = "datetime", ylab = "Voltage", main="")
  
  plot(hcdread3$Time,hcdread3$Global_reactive_power, type="l",xlab = "datetime", ylab = "Global_reactive_power", main="")
  
  })
  
  dev.copy(png, file = "plot4.png")
  dev.off()
}
