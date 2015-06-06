# read dat from file; plz note sep is ;

elecData.df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

# take data only for 2 days
spec.df<-elecData.df[elecData.df$Date %in% c("1/2/2007","2/2/2007"),]

#convert time abd date

dateTime <- strptime(paste(spec.df$Date, spec.df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#converting submeter to numeric

subMt1 <- as.numeric(spec.df$Sub_metering_1)
subMt2 <- as.numeric(spec.df$Sub_metering_2)
subMt3 <- as.numeric(spec.df$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(dateTime, subMt1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMt2, type="l", col="red")
lines(dateTime, subMt3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()





