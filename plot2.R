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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

plot(power_subset$DateTime, as.numeric(as.character(power_subset$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()