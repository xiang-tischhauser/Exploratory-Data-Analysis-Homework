test01 <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = TRUE)
test02 <- read.table("household_power_consumption.txt", sep = ";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")),  nrows = 3000)

colnames(test02) <- names(test01)
test02$DateN <- paste(test02$Date, test03$Time, sep = ",") 
test02$DateN <- as.character(test02$DateN)
test02$DateN <- strptime(test02$DateN, "%d/%m/%Y,%H:%M:%S")
test02$Date <- as.character(test02$Date) 
test03 <- subset(test02, Date != "3/2/2007")

#par(pin = c (4, 4)) 
par(mfrow=c(2,2), pin=c(1,1), mar=c(4, 4, 1,1))
with(test03, {
        # figure 1 topleft
        plot(DateN, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")
        # figure 2 topright
        plot(DateN, Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")
        # figure 3 bottom left
        plot(DateN, Sub_metering_1, type = 'l', ylab = "Enmergy sub metering", xlab = "")
        lines(test03$DateN, test03$Sub_metering_2, col = "red")
        lines(test03$DateN, test03$Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.5, bty = 'n')
        # figure 4 bottom right
        plot(DateN, Global_reactive_power, type = 'l', xlab = "datetime" )
        
        }
     )




dev.copy(png, file = "plot4.png")
dev.off()
