library(lubridate)
setwd("C:\\Users\\shash\\Documents\\Data Science\\Course 4\\Week 1")


classes <- c(rep("character",2), rep("numeric",7)) #def col classes

powerdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")

powerdataSub <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")

powerdataSub$datetimeMerged <- dmy_hms(apply(powerdataSub[,1:2], 1, paste, collapse=" "))

xAxis <- powerdataSub$datetimeMerged

yGblReactPower <- powerdataSub$Global_reactive_power
yGblActivePower <- powerdataSub$Global_active_power
yVoltage <- powerdataSub$Voltage
ySubMet1 <- powerdataSub$Sub_metering_1
ySubMet2 <- powerdataSub$Sub_metering_2
ySubMet3 <- powerdataSub$Sub_metering_3

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2))


plot(xAxis,yGblActivePower, ylab = "Global Active Power", lwd=1, type = "l" , xlab="")

plot(xAxis,ySubMet1, ylab = "Energy sub metering",lwd=1, type = "l", xlab="")
lines(xAxis, ySubMet2, col = "red")
lines(xAxis, ySubMet3, col = "blue")


legend("topright", lty = 1, bty = "n" , xjust = 1, yjust = 0,
       col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))





plot(xAxis,yVoltage, ylab = "Voltage", xlab = "datetime", lwd=1,type = "l")

plot(xAxis,yGblReactPower,ylab = "Global_reactive_power", xlab = "datetime", lwd=1, type = "l")


dev.off()


