# read dat from file; plz note sep is ;

elecData.df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

# take data only for 2 days
spec.df<-elecData.df[elecData.df$Date %in% c("1/2/2007","2/2/2007"),]

#convert time abd date

dateTime <- strptime(paste(spec.df$Date, spec.df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert global active column in numeric for plotting

gap<-as.numeric(spec.df$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, gap,xlab="",type="l", ylab="Global Active Power (kilowatts)")
dev.off()





