plot1 = function(filename_full)
{
  library(sqldf)
  
  #read the file
  data = read.csv.sql(filename_full, sql = 'select* from file where Date in ("1/2/2007", "2/2/2007")', header = TRUE, sep = ";", stringsAsFactors = TRUE)
  close(file(filename_full))
  
  #make the plot
  png("plot1.png", width = 480, height = 480)
  hist(data$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  close(file(filename_full))
  dev.off()
}