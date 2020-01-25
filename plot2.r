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

png("plot2.png", width=480, height=480)
plot(strptime(x, "%d/%m/%Y %H:%M:%S"),epc_doi$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
