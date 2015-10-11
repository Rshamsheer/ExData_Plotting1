plot1<- function()
{
  hcdread <- read.table("household_power_consumption.txt",header=T, sep=";",na.strings=c("?"))
  hcdread$Date <- as.Date(hcdread$Date, format = "%d/%m/%Y")
  hcdread$Temp <- paste(hcdread$Date,hcdread$Time)
  hcdread$Time <- strptime(hcdread$Temp,format = "%Y-%m-%d %H:%M:%S")
  
  hcdread1<- hcdread[hcdread$Date == "2007-02-01",]
  hcdread2<- hcdread[hcdread$Date == "2007-02-02",]
  hcdread3<- merge(hcdread1,hcdread2, all=TRUE)
  
  hist(as.numeric(hcdread3$Global_active_power),main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")
  dev.copy(png, file = "plot1.png")
  dev.off()
}
