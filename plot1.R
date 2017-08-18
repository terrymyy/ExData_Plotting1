# set to your work directory
setwd("C:/Users/yma/Documents/R coursera")

# read text file
mydatafull <- read.table("household_power_consumption.txt", sep=";",header=TRUE,na.strings = "?")
mydata <- mydatafull[(mydatafull$Date=="1/2/2007")|(mydatafull$Date=="2/2/2007"),]
mydata$Date <- strptime(mydata$Date,"%d/%m/%Y")

# histogram plotting
hist(mydata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")


## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
