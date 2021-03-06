## Exploratory Data Analysis
# Course Project 1

hpc<-read.table(file="../exdata-data-household_power_consumption/household_power_consumption.txt",sep =";",skip = 66637,nrows = 2880)
colnames(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#head(hpc)
#tail(hpc)
png(file = "plot1.png")
hist(hpc$Global_active_power,xlab="Global active power (kilowatts)",col="red",main="Global active power")
dev.off()



                 