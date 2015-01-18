dat <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")
dat2 <- dat[ which(dat$Date>='2007-02-01' & dat$Date<='2007-02-02'), ]

## Converting dates
datetime <- paste(as.Date(dat2$Date), dat2$Time)
dat2$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dat2, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global Reactive Power", xlab="")
  })

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

