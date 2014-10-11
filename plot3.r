

myFile <- read.csv("household_power_consumption.txt", sep = ";")

Feb1 <- myFile[myFile$Date=="1/2/2007",]
Feb2 <- myFile[myFile$Date=="2/2/2007",]

FebAll <- rbind(Feb1, Feb2)

remove(myFile)

png(filename="plot3.png", height=480, width=480)

Plot3 <- as.POSIXct(paste(as.character(FebAll$Date), as.character(FebAll$Time)), "%d/%m/%Y %H:%M:%S", tz="GMT")
Plot3 <- cbind(Plot3, as.character(FebAll$Sub_metering_1), as.character(FebAll$Sub_metering_2), as.character(FebAll$Sub_metering_3))

plot(Plot3[,1], Plot3[,2], type="l", ylab="Energy sub metering", xlab="", xaxt="n")
points(Plot3[,1], Plot3[,3], col="red", type="l")
points(Plot3[,1], Plot3[,4], col="blue", type="l")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(1170288000, 1170375000, 1170460740))
legend("topright", lty=c(1,1), lwd=c(2.5, 2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
