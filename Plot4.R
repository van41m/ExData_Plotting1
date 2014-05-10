#Open file, select data from Feb 2007
setwd("~/R")
power<-read.table("household_power_consumption.txt", sep = ";", header=TRUE)
power$newDate<-as.Date(power$Date, "%d/%m/%Y")
power_subset1<-subset(power, newDate=="2007-02-01")
power_subset2<-subset(power, newDate=="2007-02-02")
power_subset<-rbind(power_subset1,power_subset2)

#Create column containing date and time
DateTime<-paste(power_subset$Date,power_subset$Time)
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")
power_subset<-cbind(power_subset,DateTime)

#Create plot
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

par(mfrow=c(2,2))
plot(power_subset$DateTime, as.numeric(as.character(power_subset$Global_active_power)), type="l", ylab="Global Active Power", xlab="")
plot(power_subset$DateTime,as.numeric(as.character(power_subset$Voltage)), type="l", ylab="Voltage", xlab="datetime")
with(power_subset,plot(DateTime,as.numeric(as.character(Sub_metering_1)), type="l", ylab="Energy sub metering", xlab=""))
with(power_subset,lines(DateTime,as.numeric(as.character(Sub_metering_2)), col="red"))
with(power_subset,lines(DateTime,as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=1, col = c("black","red", "blue"),bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  
plot(power_subset$DateTime,as.numeric(as.character(power_subset$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()