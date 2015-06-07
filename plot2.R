# the following line is used for my PC since I'm on Chinese version of OS.
#Sys.setlocale("LC_TIME", "English")

# load data
DT <- fread("household_power_consumption.txt", na.string = c("?", "NA","N/A",""), select = c("Date", "Time", "Global_active_power"), colClasses = c("character","character","character","character","character","character","character","character",  "character"));
dat <- DT[DT$Date=="2/2/2007" |DT$Date=="1/2/2007"];

# convert type
y <- dat$Global_active_power;
y <- as.numeric(y);
x <- strptime(paste(dat$Date, dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

# draw png
png(file = "plot2.png", bg = "transparent");
plot(x, y, "l", ylab = "Global Active Power (kilowatts)", xlab = "");
dev.off();
