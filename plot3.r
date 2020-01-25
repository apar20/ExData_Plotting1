rm(list = ls())
epc_total<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
dim(epc_total)
epc_doi<-subset(epc_total, Date=="1/2/2007"|Date=="2/2/2007")
dim(epc_doi)
write.csv(epc_doi,"Electric Power Consumption on Dates of Interest.csv")
gap<-as.numeric(epc_doi$Global_active_power)

dates<-epc_doi$Date
times<-epc_doi$Time
x <- paste(dates, times)
strptime(x, "%d/%m/%Y %H:%M:%S")

sm1<-epc_doi$Sub_metering_1
sm2<-epc_doi$Sub_metering_2
sm3<-epc_doi$Sub_metering_3

png("plot3.png", width=480, height=480)
plot(strptime(x, "%d/%m/%Y %H:%M:%S"),sm1,type="l", ylab="Energy sub metering", xlab="")
lines(strptime(x, "%d/%m/%Y %H:%M:%S"),sm2, col="red")
lines(strptime(x, "%d/%m/%Y %H:%M:%S"),sm3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


dev.off()
