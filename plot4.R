
setwd("C:/gahpeng/coursera/04_Exploratory Data Analysis/Course Project 1")

#load data to R
datafilename <- "./household_power_consumption.txt"
data <- read.table(datafilename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#using data from the dates 2007-02-01 and 2007-02-02
data$newdate<-strptime(data$Date, "%d/%m/%Y")
usedData <- data[data$newdate %in% c(strptime("01/02/2007", "%d/%m/%Y"),strptime("02/02/2007", "%d/%m/%Y")) ,]

#create new colume with date  time
usedData$newdatetime<- strptime(paste(usedData$Date, usedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Construct the plots and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot4.png", width=480, height=480, units="px")
par(mfrow = c(2, 2)) 

plot(usedData$newdatetime,as.numeric(usedData$Global_active_power),  type="l", ylab="Global Active Power", xlab="")

plot(usedData$newdatetime,as.numeric(usedData$Voltage),  type="l", ylab="Voltage", xlab="datetime")

plot(usedData$newdatetime,as.numeric(usedData$Sub_metering_1),  type="l", ylab="Energy Sub Metering", xlab="")
lines(usedData$newdatetime, as.numeric(usedData$Sub_metering_2), type="l", col="red")
lines(usedData$newdatetime, as.numeric(usedData$Sub_metering_3), type="l", col="blue")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

plot(usedData$newdatetime,as.numeric(usedData$Global_reactive_power),  type="l", ylab="Global Reactive Power", xlab="datetime")

dev.off()
