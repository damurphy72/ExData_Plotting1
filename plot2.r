

myFile <- read.csv("household_power_consumption.txt", sep = ";")

Feb1 <- myFile[myFile$Date=="1/2/2007",]
Feb2 <- myFile[myFile$Date=="2/2/2007",]

FebAll <- rbind(Feb1, Feb2)

remove(myFile)

png(filename="plot2.png", height=480, width=480)
Plot2 <- cbind(as.POSIXct(paste(as.character(FebAll$Date), as.character(FebAll$Time)), "%d/%m/%Y %H:%M:%S", tz="GMT"), as.character(FebAll$Global_active_power))
plot(Plot2[,1], Plot2[,2], type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(1170288000, 1170375000, 1170460740))
dev.off()
