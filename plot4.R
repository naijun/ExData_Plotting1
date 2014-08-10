plot4 <- function(){
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
  
  ## launch the png graphic device and specify the dimension as 2x2 row-wise
  png(file="plot4.png", width=480, height=480)
  par(mfrow = c(2,2))
  
  ## plot top-left graph Global Active Power against Datetime
  plot(x,data$Global_active_power, ylab="Global Active Power", 
       xlab = "", type="l")
  
  ## plot top-right graph Voltage against Datetime
  plot(x,data$Voltage, ylab = "Voltage", xlab = "datetime", type="l")
  
  ## plot bottom-left Energy sub metering against Datetime
  plot(x,data$Sub_metering_1, ylab="Energy sub metering", xlab = "", type="l")
  lines(x, data$Sub_metering_2, col="red")
  lines(x, data$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         lty=c(1,1,1), col=c("black","red","blue"), bty = "n", cex = 0.9)
  
  ## plot bottom-right graph
  plot(x,data$Global_reactive_power, ylab = "Global_reactive_power", 
       xlab = "datetime", type="l")
  
  ## close the device
  dev.off()
}