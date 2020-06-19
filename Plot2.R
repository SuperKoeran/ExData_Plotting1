#Reading in the data source

data <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                 na.strings ="?", nrows=2075259, check.names=F, comment.char="",quote='\"')
data2 <- subset(data,Date %in% c("1/2/2007", "2/2/2007"))
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date),data2$Time)
data2$datetime <- as.POSIXct(datetime)

#Plot 
png("plot2.png", width=480, height = 480)

with(data2, {
    plot(Global_active_power~datetime, type="l",
         ylab ="Global ACtive Power (kilowatts)",xlab="")
})


dev.off()
