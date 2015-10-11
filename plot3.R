plot3<- function()
{
  hcdread <- read.table("household_power_consumption.txt",header=T, sep=";",na.strings=c("?"))
  hcdread$Date <- as.Date(hcdread$Date, format = "%d/%m/%Y")
  hcdread$Temp <- paste(hcdread$Date,hcdread$Time)
  hcdread$Time <- strptime(hcdread$Temp,format = "%Y-%m-%d %H:%M:%S")
  
  hcdread1<- hcdread[hcdread$Date == "2007-02-01",]
  hcdread2<- hcdread[hcdread$Date == "2007-02-02",]
  hcdread3<- merge(hcdread1,hcdread2, all=TRUE)
  
  plot(hcdread3$Time,hcdread3$Sub_metering_1, type="l",xlab = "", ylab = "Global Active Power (kilowatts)", main="")
  lines(hcdread3$Time,hcdread3$Sub_metering_2,col="red")
  lines(hcdread3$Time,hcdread3$Sub_metering_3,col="blue")
  legend("topright",lty=1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.copy(png, file = "plot3.png")
  dev.off()
}
