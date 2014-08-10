plot2 <- function(){
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
  
  ## launch the png graphic device and plot
  png(file="plot2.png", width=480, height=480)
  plot(x,data$Global_active_power, ylab="Global Active Power (kilowatts)",
       xlab = "", type="l")
  dev.off()
}