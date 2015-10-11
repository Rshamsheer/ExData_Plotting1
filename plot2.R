plot2<- function()
{
  hcdread <- read.table("household_power_consumption.txt",header=T, sep=";",na.strings=c("?"))
  hcdread$Date <- as.Date(hcdread$Date, format = "%d/%m/%Y")
  hcdread$Temp <- paste(hcdread$Date,hcdread$Time)
  hcdread$Time <- strptime(hcdread$Temp,format = "%Y-%m-%d %H:%M:%S")
  
  hcdread1<- hcdread[hcdread$Date == "2007-02-01",]
  hcdread2<- hcdread[hcdread$Date == "2007-02-02",]
  hcdread3<- merge(hcdread1,hcdread2, all=TRUE)
  
  plot(hcdread3$Time,hcdread3$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)", main="")
  dev.copy(png, file = "plot2.png")
  dev.off()
}
