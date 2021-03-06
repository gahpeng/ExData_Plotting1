
setwd("C:/gahpeng/coursera/04_Exploratory Data Analysis/Course Project 1")

#load data to R
datafilename <- "./household_power_consumption.txt"
data <- read.table(datafilename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#using data from the dates 2007-02-01 and 2007-02-02
data$newdate<-strptime(data$Date, "%d/%m/%Y")
usedData <- data[data$newdate %in% c(strptime("01/02/2007", "%d/%m/%Y"),strptime("02/02/2007", "%d/%m/%Y")) ,]

#create new colume with date  time
usedData$newdatetime<- strptime(paste(usedData$Date, usedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width=480, height=480, units="px")
plot(usedData$newdatetime,as.numeric(usedData$Global_active_power),  type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()