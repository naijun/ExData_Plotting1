plot1 <- function(){
  ## load the complete data assuming the computer has enough memory
  ## note the separator is ";" and convert "?" to NA values
  data <- read.table("household_power_consumption.txt",sep=";", 
                     header=TRUE, na.strings="?")
  
  ## convert first column to Date format
  data$Date <- as.Date(data$Date,"%d/%m/%Y")
  
  ## subset the data and select only 2007-02-01 and 2007-02-02
  data <- subset(data, Date=="2007-02-01" | Date == "2007-02-02")
  
  ## launch the png graphic device and plot the histogram 
  png(file="plot1.png", width=480, height=480)
  with(data,hist(Global_active_power, main="Global Active Power", col=2, 
                  xlab="Global Active Power (kilowatts)"))
  dev.off()
  
}