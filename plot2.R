dat <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")
dat2 <- dat[ which(dat$Date>='2007-02-01' & dat$Date<='2007-02-02'), ]


## Converting dates
datetime <- paste(as.Date(dat2$Date), dat2$Time)
dat2$Datetime <- as.POSIXct(datetime)

plot(dat2$Datetime, dat2$Global_active_power,
     type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

