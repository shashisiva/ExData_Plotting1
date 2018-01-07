library(lubridate)
setwd("C:\\Users\\shash\\Documents\\Data Science\\Course 4\\Week 1")


classes <- c(rep("character",2), rep("numeric",7)) #def col classes

powerdata <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ';', na.strings = "?")

powerdataSub <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")



png(filename = "plot2.png", width = 480, height = 480)

powerdataSub$datetimeMerged <- dmy_hms(apply(powerdataSub[,1:2], 1, paste, collapse=" "))

 x <- powerdataSub$datetimeMerged

 y <- powerdataSub$Global_active_power
 
 plot(x,y,
   
      ylab = "Global Active Power (kilowatts)", xlab = "", lwd=1,
       type = "l"
      
      )

dev.off()
