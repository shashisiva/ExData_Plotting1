setwd("C:\\Users\\shash\\Documents\\Data Science\\Course 4\\Week 1")


classes <- c(rep("character",2), rep("numeric",7)) #def col classes

powerdata <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ';', na.strings = "?")

powerdataSub <- subset(powerdata, Date == "1/2/2007" | Date == "2/2/2007")
powerdataSub$Date <- as.Date( as.character(powerdataSub$Date), "%d/%m/%y")

png(filename = "plot1.png", width = 480, height = 480)


hist(powerdataSub$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red", ylim= c(0,1200))


dev.off()

