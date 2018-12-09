#Read the data and declare it as HHData
HHdata<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
HHdata<-tbl_df(HHdata)

#Subset the data to only the specified period
HHdata_Subset<-subset(HHdata,HHdata$Date=="1/2/2007"|HHdata$Date=="2/2/2007")

#Taking only the Global Active Power (GAP) and change to numbers
GAP<-HHdata_Subset$Global_active_power
GAP_Numbers<-as.numeric(as.character(GAP))

#Plot the Histogram
png("plot1.png",width=480,height=480)
hist(GAP_Numbers,main="Global Active Power",xlab="Global Active Power (kilowatt)", ylab="Frequency",col="red")
dev.off()
