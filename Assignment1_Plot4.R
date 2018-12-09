#Read the data and declare it as HHData
HHdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
HHdata<-tbl_df(HHdata)

#Subset the data to only the specified period
HHdata_Subset<-subset(HHdata,HHdata$Date=="1/2/2007"|HHdata$Date=="2/2/2007")

#Taking Global Active Power (GAP), Voltage and Global Reactive Power (GRP)
GAP<-HHdata_Subset$Global_active_power
GAP_Numbers<-as.numeric(as.character(GAP))
Voltage<-as.numeric(as.character(HHdata_Subset$Voltage))
GAR<-as.numeric(as.character(HHdata_Subset$Global_reactive_power))


#Plot the Line
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime, GAP_Numbers, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, HHdata_Subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="green",ylim=c(0,40))
par(new=TRUE)

plot(datetime, HHdata_Subset$Sub_metering_2, type="l", xlab="", ylab="",col="red",ylim=c(0,40))
par(new=TRUE)

plot(datetime, HHdata_Subset$Sub_metering_3, type="l", xlab="", ylab="",col="blue",ylim=c(0,40))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","red","blue"),cex=0.5)

plot(datetime, GAR, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()