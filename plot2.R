## ---------------------------
##
## Script name: plot2
##
## Purpose of script:recreate second plot
##
## Author: Henry Letton
##
## Date Created: 2019-06-20
##
## ---------------------------
##
## Notes:
##   This is the second of 4 scripts for the coursera course assignment
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
png(file="plot2.png", width=480, height=480)
#Plot graph to match aim graph
plot(data$datetime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power)
#Close graphic
dev.off()
