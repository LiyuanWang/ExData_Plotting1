# read data
DT <- fread("household_power_consumption.txt", na.string = c("?", "NA","N/A",""), select = c("Date", "Global_active_power"), colClasses = c("character","character","character","character","character","character","character","character",  "character"));

# get correct type of data
dat <- DT[DT$Date=="2/2/2007" |DT$Date=="1/2/2007"]$Global_active_power;
dat <- as.numeric(dat);

# start to draw png
png(file = "plot1.png", bg = "transparent");
hist(dat, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)");
dev.off();