# set to your work directory
setwd("C:/Users/yma/Documents/R coursera")

# read text file
mydatafull <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")
mydata <- mydatafull[(mydatafull$Date=="1/2/2007")|(mydatafull$Date=="2/2/2007"),]
DateTime <- paste(mydata$Date,mydata$Time)
mydata$DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

# plot3
png("plot3.png",width=480,height=480)
plot(mydata$DateTime,mydata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(mydata$DateTime,mydata$Sub_metering_2,col="Red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty = 1,lwd=1)

## export file
dev.off()
