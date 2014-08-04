##This script assumes data are unzipped and in working directory.

#Read in and subset data (to save processing time, if objects are already in 
#memory execute from line 15) 
col_classes <- c(rep("character", 2), rep("numeric", 7))
data <- read.table("household_power_consumption.txt", sep=";", na.strings ="?",
        nrows = 2075259, stringsAsFactors = FALSE, header = TRUE,
        colClasses = col_classes)
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#overwrite data in memory with subset to reduce memory use
begin <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")
data <- subset(data, Date %in% c(begin, end))

#make the scatterplot
png(filename = "plot2.png", bg = "transparent", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", 
        ylab = "Global Active Power (kilowatts)")
dev.off()





