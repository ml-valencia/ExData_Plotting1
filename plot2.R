library(lubridate)

HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
HPCsub<-HPC[which(HPC$Date=="1/2/2007" | HPC$Date=="2/2/2007"),]
HPCsub$datetime<-dmy_hms(paste(HPCsub$Date,HPCsub$Time, sep=" "))
head(HPCsub)

dev.cur()
png("plot2.png",height=480,width=480)
plot(HPCsub$datetime,HPCsub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()