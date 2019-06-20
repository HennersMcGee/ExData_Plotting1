## ---------------------------
##
## Script name: plot4
##
## Purpose of script:recreate fourth plot
##
## Author: Henry Letton
##
## Date Created: 2019-06-20
##
## ---------------------------
##
## Notes:
##   This is the last of 4 scripts for the coursera course assignment
##   for week 1 of the Exploratory Data Analysis course.
##
## ---------------------------

#Read in the data, from a "data" folder in working directory
data <- read.delim("./data/household_power_consumption.txt", sep=";",stringsAsFactors = FALSE, na.strings = "?")
#Clean data so it has one field for datetime and only the time period we are analsing
data$datetime <- paste(data$Date,data$Time,sep=":")
library(lubridate)
data$datetime <- dmy_hms(data$datetime); data$Date <- NULL; data$Time <- NULL
data <- data[(data$datetime<=as_date("2007-02-03") &
                  data$datetime>=as_date("2007-02-01")),]

#Set up plot to be exported to a png format
png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2), cex=0.7)
#Plot each graph to match aim graph, gap between the 4 graphs
plot(data$datetime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(data$datetime, data$Global_active_power)

plot(data$datetime, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(data$datetime, data$Voltage)

plot(data$datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$datetime, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$datetime, data$Global_reactive_power)
#Close graphic
dev.off()

