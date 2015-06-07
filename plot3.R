# the following line is used for my PC since I'm on Chinese version of OS.
#Sys.setlocale("LC_TIME", "English")

# load data
DT <- fread("household_power_consumption.txt", na.string = c("?", "NA","N/A",""), select = c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character","character","character","character","character","character","character","character",  "character"));
dat <- DT[DT$Date=="2/2/2007" |DT$Date=="1/2/2007"];

# convert data
y1 <- as.numeric(dat$Sub_metering_1);
y2 <- as.numeric(dat$Sub_metering_2);
y3 <- as.numeric(dat$Sub_metering_3);
x <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

# draw png
png(file = "plot3.png", bg = "transparent");
plot(x, y1, "l", ylab = "Energy sub metering", xlab = "");
lines(x, y2, "l", col = "red");
lines(x, y3, "l", col = "blue");
legend("topright", pch = "¡ª", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
dev.off();
