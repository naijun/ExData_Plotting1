plot3 <- function(){
  ## load the complete data assuming the computer has enough memory
  ## note the separator is ";" and convert "?" to NA values
  data <- read.table("household_power_consumption.txt",sep=";", 
                     header=TRUE, na.strings="?")
  
  ## convert first column to Date format
  data$Date <- as.Date(data$Date,"%d/%m/%Y")
  
  ## subset the data and select only 2007-02-01 and 2007-02-02
  data <- subset(data, Date=="2007-02-01" | Date == "2007-02-02")
  
  ## combine the date and time for plotting and save into a variab x
  x <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
  
  ## launch the png graphic device
  png(file="plot3.png", width=480, height=480)
  
  ## plot Sub_metering_1 first
  plot(x,data$Sub_metering_1, ylab="Energy sub metering", xlab = "", type="l")
  
  ## add lines on Sub_metering_2 and Sub_metering_3
  lines(x, data$Sub_metering_2, col="red")
  lines(x, data$Sub_metering_3, col="blue")
  
  ## add legend
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1), col=c("black","red","blue"))
  
  ## close the device
  dev.off()
  
}