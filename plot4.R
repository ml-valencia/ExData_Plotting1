library(lubridate)

HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
HPCsub<-HPC[which(HPC$Date=="1/2/2007" | HPC$Date=="2/2/2007"),]
HPCsub$datetime<-dmy_hms(paste(HPCsub$Date,HPCsub$Time, sep=" "))
head(HPCsub)


dev.cur()
png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(HPCsub$datetime,HPCsub$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(HPCsub$datetime,HPCsub$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(HPCsub$datetime,HPCsub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(HPCsub$datetime,HPCsub$Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red")
lines(HPCsub$datetime,HPCsub$Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue")
legend("topright",inset=0.01,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lty=0)  
plot(HPCsub$datetime,HPCsub$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()