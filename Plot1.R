## graphing , week 1, Plot 1
library(data.table)
library(lubridate)

## reading data set 
D <- data.table(read.table('household_power_consumption.txt',sep = ';'))

names(D) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
    "Sub_metering_1","Sub_metering_2","Sub_metering_3") 
D <- D[-1,] # removing the column labels

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
D <- D[dmy(D$Date) == dmy('01/02/2007') | dmy(D$Date) == dmy('02/02/2007'),]

## set labels:
## x_label <- "Global Active Power (kilowatts)"
## y_label <- "Frequency"

png(file = "Plot1.png")

hist(as.numeric(as.character(D$Global_active_power)),
    col  = "red", 
    main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)",
    ylab = "Frequency")

dev.off()
