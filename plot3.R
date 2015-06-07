plot3 = function(filename_full)
{
  library(sqldf)
  
  #read the file
  data = read.csv.sql(filename_full, sql = 'select* from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ";", stringsAsFactors = TRUE)
  close(file(filename_full))
  
  #convert the date atrribute
  dateTime   <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
  
  #make the plot
  png("plot3.png", width = 480, height = 480)
  plot( dateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(dateTime, data$Sub_metering_2, col = "red")
  lines(dateTime, data$Sub_metering_3, col = "blue")
  axis(side = 2, lwd = 2)
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1,1))
  dev.off()
}