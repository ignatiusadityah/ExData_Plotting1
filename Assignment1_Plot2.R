#Read the data and declare it as HHData
HHdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
HHdata<-tbl_df(HHdata)

#Subset the data to only the specified period
HHdata_Subset<-subset(HHdata,HHdata$Date=="1/2/2007"|HHdata$Date=="2/2/2007")

#Taking only the Global Active Power (GAP) and change to numbers
GAP<-HHdata_Subset$Global_active_power
GAP_Numbers<-as.numeric(as.character(GAP))

#Add Datetime 
datetime <- strptime(paste(HHdata_Subset$Date, HHdata_Subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot the Line
png("plot2.png",width=480,height=480)
plot(datetime, GAP_Numbers, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
