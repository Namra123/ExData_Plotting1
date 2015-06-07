plot2 = function(filename_full)
{
  library(sqldf)
  
  #read the file
  data = read.csv.sql(filename_full, sql = 'select* from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ";", stringsAsFactors = TRUE)
  close(file(filename_full))
  
  #convert the date atrribute
  dateTime   <- as.POSIXlt(paste(as.Date(data$Date, format="%d/%m/%Y"), data$Time, sep=" "))
  
  #make the plot
  png("plot2.png", width = 480, height = 480)
  plot( dateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  axis(side = 2, lwd = 2)
  dev.off()
}