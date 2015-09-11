test01 <- read.table("household_power_consumption.txt", sep = ";", nrows = 10, header = TRUE)
test02 <- read.table("household_power_consumption.txt", sep = ";", skip = grep("1/2/2007", readLines("household_power_consumption.txt")),  nrows = 3000)
colnames(test02) <- names(test01)
test02$Date <- as.Date(test02$Date) 
test03 <- subset(test02, Date != "3/2/2007")

hist(test03$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
