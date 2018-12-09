#Read the data and declare it as HHData
HHdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
HHdata<-tbl_df(HHdata)

#Subset the data to only the specified period
HHdata_Subset<-subset(HHdata,HHdata$Date=="1/2/2007"|HHdata$Date=="2/2/2007")


#Plot the Histogram
datetime <- strptime(paste(b$Date, b$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, b$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="green",ylim=c(0,40))
par(new=TRUE)
plot(datetime, b$Sub_metering_2, type="l", xlab="", ylab="",col="red",ylim=c(0,40))
par(new=TRUE)
plot(datetime, b$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","red","blue"))
dev.off()