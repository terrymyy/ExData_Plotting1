# set to your work directory
setwd("C:/Users/yma/Documents/R coursera")

# read text file
mydatafull <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")
mydata <- mydatafull[(mydatafull$Date=="1/2/2007")|(mydatafull$Date=="2/2/2007"),]
DateTime <- paste(mydata$Date,mydata$Time)
mydata$DateTime <- strptime(DateTime,"%d/%m/%Y %H:%M:%S")

# plot2
plot(y=mydata$Global_active_power,x=mydata$DateTime,type="l",ylab="Global Active Power(kilowatts)",xlab="")

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
