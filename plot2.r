test01 <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = TRUE)
test02 <- read.table("household_power_consumption.txt", sep = ";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")),  nrows = 3000)

colnames(test02) <- names(test01)
test02$DateN <- paste(test02$Date, test03$Time, sep = ",") 
test02$DateN <- as.character(test02$DateN)
test02$DateN <- strptime(test02$DateN, "%d/%m/%Y,%H:%M:%S")
test02$Date <- as.character(test02$Date) 
test03 <- subset(test02, Date != "3/2/2007")

plot(test03$DateN, test03$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
