# set to your work directory
setwd("C:/Users/yma/Documents/R coursera")

# read text file
mydatafull <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")
mydata <- mydatafull[(mydatafull$Date=="1/2/2007")|(mydatafull$Date=="2/2/2007"),]
DateTime <- paste(mydata$Date,mydata$Time)
mydata$DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

# plot4
png("plot4.png",width=480,height=480)

# define the layout of subplots
par(mfrow=c(2,2))

# plot (1,1)
plot(y=mydata$Global_active_power,x=mydata$DateTime,type="l",ylab="Global Active Power(kilowatts)",xlab="")

# plot (1,2)
plot(y=mydata$Voltage,x=mydata$DateTime,type="l",ylab="Voltage",xlab="datetime")

# plot (2,1)
plot(mydata$DateTime,mydata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(mydata$DateTime,mydata$Sub_metering_2,col="Red")
lines(mydata$DateTime,mydata$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty = 1,bty="n")

# plot (2,2)
plot(y=mydata$Global_reactive_power,x=mydata$DateTime,type="l",ylab="Global_reactive_power",xlab="datetime")

# export file
dev.off()
