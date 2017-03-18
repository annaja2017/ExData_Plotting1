## graphing , week 1, Plot 4
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

png(file = "Plot4.png") # default is width = 480, height = 480

par(mfcol = c(2,2))
##### subplot 1
plot(x = as.numeric(as.character(D$Global_active_power)),
     col  = "black", 
     main = " ",
     ylab = "Global Active Power",
     xlab = " ",
     type = "l",
     axes = FALSE
)

## Make x axis using Mon-Fri labels
axis(side = 1, 
     at = c(min(which(theDay == unique(theDay)[1])),min(which(theDay == unique(theDay)[2])),dim(D)[1]), 
     labels = c("Thu","Fri","Sat"))
axis(side = 2, 
     at = seq(from = 0, to = 6, by = 2),
     las=1)

## put a box around the plot
box()


###### subplot 2
y_lim <- range(as.numeric(as.character(D$Sub_metering_1)))
plot(x = as.numeric(D$Sub_metering_1),
     col  = "black", 
     main = " ",
     ylab = "Energy sub metering",
     xlab = " ",
     type = "l",
     axes = FALSE,
     ylim = y_lim
)
par(new = TRUE)
plot(x = as.numeric(as.character(D$Sub_metering_2)),
     col  = "red", 
     main = " ",
     ylab = "Energy sub metering",
     xlab = " ",
     type = "l",
     axes = FALSE,
     ylim = y_lim
)
par(new = TRUE)
plot(x = as.numeric(as.character(D$Sub_metering_3)),
     col  = "blue", 
     main = " ",
     ylab = "Energy sub metering",
     xlab = " ",
     type = "l",
     axes = FALSE,
     ylim = y_lim
)
# Make x axis using Mon-Fri labels
axis(side = 1, 
     at = c(min(which(theDay == unique(theDay)[1])),min(which(theDay == unique(theDay)[2])),dim(D)[1]), 
     labels = c("Thu","Fri","Sat"))
axis(side = 2, 
     at = seq(from = 0, to = 30, by = 10),
     las=1)

## adding the legend
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = c(1,1))

## put a box around the plot
box()

###### subplot 3
plot(x = as.numeric(as.character(D$Voltage)),
     col  = "black", 
     main = " ",
     ylab = "Voltage",
     xlab = "datetime",
     type = "l",
     axes = FALSE
)

# Make x axis using Mon-Fri labels
axis(side = 1, 
     at = c(min(which(theDay == unique(theDay)[1])),min(which(theDay == unique(theDay)[2])),dim(D)[1]), 
     labels = c("Thu","Fri","Sat"))

## the original figure had range from 0 to 6. 
## but the range range(as.numeric(D$Global_active_power)/1000) is 0.074 3.692, < 4
axis(side = 2, 
     at = seq(from = 234,to = 245,by = 4),
     las=1)

## put a box around the plot
box()

## subplot 4
plot(x = as.numeric(as.character(D$Global_reactive_power)),
     col  = "black", 
     main = " ",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l",
     axes = FALSE
)

# Make x axis using Mon-Fri labels
axis(side = 1, 
     at = c(min(which(theDay == unique(theDay)[1])),min(which(theDay == unique(theDay)[2])),dim(D)[1]), 
     labels = c("Thu","Fri","Sat"))

## the original figure had range from 0 to 6. 
## but the range range(as.numeric(D$Global_active_power)/1000) is 0.074 3.692, < 4
axis(side = 2, 
     at = seq(from = 0, to = 0.5, by = 0.1),
     las=1,
     hadj = 1)

## put a box around the plot
box()

dev.off()
