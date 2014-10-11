

myFile <- read.csv("household_power_consumption.txt", sep = ";")

Feb1 <- myFile[myFile$Date=="1/2/2007",]
Feb2 <- myFile[myFile$Date=="2/2/2007",]

FebAll <- rbind(Feb1, Feb2)

remove(myFile)

png(filename="plot1.png", height=480, width=480)
hist(as.numeric(as.character(FebAll$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

