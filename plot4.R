## Exploratory Data Analysis
# Course Project 1

hpc<-read.table(file="../exdata-data-household_power_consumption/household_power_consumption.txt",sep =";",skip = 66637,nrows = 2880)
colnames(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc<-data.frame(hpc, strptime(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
colnames(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3","dt")


#Sys.setlocale(locale = "C")
png(file = "plot4.png")
par(mfrow = c(2, 2))
with(hpc,{
  plot(hpc$dt,hpc$Global_active_power,ylab="Global active power",xlab="",type = "l")
  plot(hpc$dt,hpc$Voltage,ylab="Voltage",xlab="datetime",type = "l")
  with(hpc,plot(hpc$dt,hpc$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab=""))
  with(hpc,{
    lines(hpc$dt,hpc$Sub_metering_2, col="red")
    lines(hpc$dt,hpc$Sub_metering_3, col="blue")
    legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
  })
  plot(hpc$dt,hpc$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type = "l")
  })
dev.off()
