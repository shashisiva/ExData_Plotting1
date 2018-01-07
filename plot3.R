library(lubridate)
setwd("C:\\Users\\shash\\Documents\\Data Science\\Course 4\\Week 1")


classes <- c(rep("character",2), rep("numeric",7)) #def col classes

powerdata <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ';', na.strings = "?")

powerdataSub <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")



png(filename = "plot3.png", width = 480, height = 480)

powerdataSub$datetimeMerged <- dmy_hms(apply(powerdataSub[,1:2], 1, paste, collapse=" "))

x <- powerdataSub$datetimeMerged

y1 <- powerdataSub$Sub_metering_1
y2 <- powerdataSub$Sub_metering_2
y3 <- powerdataSub$Sub_metering_3

plot(x,y,
     
     ylab = "Energy Sub metering", xlab = "", lwd=1,
     type = "l",
     col = "black"
     
)

lines(x, y2, col = "red")
lines(x, y3, col = "blue")


legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
