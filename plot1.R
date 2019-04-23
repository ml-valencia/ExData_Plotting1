HPC<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
HPCsub<-HPC[which(HPC$Date=="1/2/2007" | HPC$Date=="2/2/2007"),]

dev.cur()
png("plot1.png",height=480, width=480)
hist(as.numeric(HPCsub$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
