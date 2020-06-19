#Reading in the data source

data <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings ="?", nrows=2075259, check.names=F, comment.char="",quote='\"')
data2 <- subset(data,Date %in% c("1/2/2007", "2/2/2007"))
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date),data2$Time)
data2$datetime <- as.POSIXct(datetime)

#Plot 4
png("plot4.png", width=480, height = 480)
par(mfrow=c(2,2))
with(data2, {
    plot(Global_active_power~datetime, type="l",
         ylab ="Global Active Power",xlab="")
    plot(Voltage~datetime, type="l",
         ylab ="Voltage", xlab="datetime")
    plot(Sub_metering_1~datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~datetime, col='Red')
    lines(Sub_metering_3~datetime, col='Blue')

legend("topright", col=c("black","red","blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(Global_reactive_power~datetime, type="l",
     ylab ="Global_reactive_power",xlab="datetime")
})



dev.off()


