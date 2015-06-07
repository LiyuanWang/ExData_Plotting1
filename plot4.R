# the following line is used for my PC since I'm on Chinese version of OS.
#Sys.setlocale("LC_TIME", "English")

# load data
DT <- fread("household_power_consumption.txt", na.string = c("?", "NA","N/A",""), colClasses = c("character","character","character","character","character","character","character","character",  "character"));
dat <- DT[DT$Date=="2/2/2007" |DT$Date=="1/2/2007"];
png(file = "plot4.png", bg = "transparent");

# parse png
par(mfrow = c(2,2));
x <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

# top left plot
y <- as.numeric(dat$Global_active_power);
plot(x, y, "l", ylab = "Global Active Power", xlab = "");

# top right plot
y <- as.numeric(dat$Voltage);
plot(x, y, "l", ylab = "Voltage", xlab = "datetime");

# bottom left plot
y1 <- as.numeric(dat$Sub_metering_1);
y2 <- as.numeric(dat$Sub_metering_2);
y3 <- as.numeric(dat$Sub_metering_3);
plot(x, y1, "l", ylab = "Energy sub metering", xlab = "");
lines(x, y2, "l", col = "red");
lines(x, y3, "l", col = "blue");
legend("topright", pch = "¡ª", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.col = NA);

# bottom right plot
y <- as.numeric(dat$Global_reactive_power);
plot(x, y, "l", ylab = "Global_reactive_power", xlab = "datetime");
dev.off();
