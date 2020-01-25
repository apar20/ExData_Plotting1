rm(list = ls())
epc_total<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
dim(epc_total)
epc_doi<-subset(epc_total, Date=="1/2/2007"|Date=="2/2/2007")
dim(epc_doi)
write.csv(epc_doi,"Electric Power Consumption on Dates of Interest.csv")
gap<-as.numeric(epc_doi$Global_active_power)

png("plot1.png", width=480, height=480)
hist(gap, width=480, height=480, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
