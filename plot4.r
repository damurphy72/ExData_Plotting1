
myFile <- read.csv("household_power_consumption.txt", sep = ";")

Feb1 <- myFile[myFile$Date=="1/2/2007",]
Feb2 <- myFile[myFile$Date=="2/2/2007",]

FebAll <- rbind(Feb1, Feb2)

remove(myFile)

png(filename="plot4.png", height=480, width=480)

par(mfrow=c(2,2))

#Process plot 1
Plot4 <- cbind(as.POSIXct(paste(as.character(FebAll$Date), as.character(FebAll$Time)), "%d/%m/%Y %H:%M:%S", tz="GMT"), as.character(FebAll$Global_active_power))
plot(Plot4[,1], Plot4[,2], type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(1170288000, 1170375000, 1170460740))

#Process plot 2
Plot4 <- cbind(Plot4, as.character(FebAll$Voltage))
plot(Plot4[,1], Plot4[,3], type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(1170288000, 1170375000, 1170460740))

#Process plot 3
Plot4 <- cbind(Plot4, as.character(FebAll$Sub_metering_1), as.character(FebAll$Sub_metering_2), as.character(FebAll$Sub_metering_3))
plot(Plot4[,1], Plot4[,4], type="l", ylab="Energy sub metering", xlab="", xaxt="n")
points(Plot4[,1], Plot4[,5], col="red", type="l")
points(Plot4[,1], Plot4[,6], col="blue", type="l")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(1170288000, 1170375000, 1170460740))
legend("topright", lty=c(1,1), bty="n", lwd=c(2.5, 2.5), cex=0.8, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Process plot 4
Plot4 <-cbind(Plot4, as.character(FebAll$Global_reactive_power))
plot(Plot4[,1], Plot4[,7], type="l", xaxt="n", ylab="Global_reactive_power", xlab="datetime")
axis(side=1, labels=c("Thu", "Fri", "Sat"), at=c(1170288000, 1170375000, 1170460740))

dev.off()
