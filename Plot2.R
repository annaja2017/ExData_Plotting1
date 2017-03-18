## graphing , week 1, Plot 2
library(data.table)
library(lubridate)

## reading data set 
D <- data.table(read.table('household_power_consumption.txt',sep = ';'))

names(D) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
              "Sub_metering_1","Sub_metering_2","Sub_metering_3") 
D <- D[-1,] # removing the column labels

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
D <- D[dmy(D$Date) == dmy('01/02/2007') | dmy(D$Date) == dmy('02/02/2007'),]

theDay <- weekdays(dmy(D$Date))

png(file = "Plot2.png")

plot(x = as.numeric(as.character(D$Global_active_power)),
     col  = "black", 
     main = " ",
     ylab = "Global Active Power (kilowatts)",
     xlab = " ",
     type = "l",
     axes = FALSE
     )

# Make x axis using Mon-Fri labels
axis(side = 1, 
     at = c(min(which(theDay == unique(theDay)[1])),min(which(theDay == unique(theDay)[2])),dim(D)[1]), 
     labels = c("Thu","Fri","Sat"))

axis(side = 2, 
     at = seq(from = 0, to = 6, by = 2),
     labels = as.character(seq(from = 0, to = 6, by = 2)))

## put a box around the plot
box()

dev.off()
