dat <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
dat$Date<-as.Date(dat$Date, format="%d/%m/%Y")
dat2 <- dat[ which(dat$Date>='2007-02-01' & dat$Date<='2007-02-02'), ]

hist(as.numeric(dat2$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (killowats)");

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

