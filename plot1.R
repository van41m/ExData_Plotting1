#Open file, select data from Feb 2007
setwd("~/R")
power<-read.table("household_power_consumption.txt", sep = ";", header=TRUE)
power$Date<-as.Date(power$Date, "%d/%m/%Y")
power_subset1<-subset(power, Date=="2007-02-01")
power_subset2<-subset(power, Date=="2007-02-02")
power_subset<-rbind(power_subset1,power_subset2)

#Create plot
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

hist(as.numeric(as.character(power_subset$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()