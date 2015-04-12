#Function to plot multiple lines in 1 graph

myplot<-function()
{  
  data<-read.table("household_power_consumption.txt",sep=";",colClasses="character",header=TRUE)
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  starts<-as.Date("2007-02-01")   
  ends<-as.Date("2007-02-02")
  data<-data[data$Date <= ends,]           #Subsetting the Dates for the required Time Periods
  data<-data[data$Date >= starts,]        
  time_period<-as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S") #converting the dates to POSIX object
  png("plot3.png",width=480,height=480)
  plot(time_period,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Global Active Power(kilowatts)")
  lines(time_period,data$Sub_metering_2,col="red")
  lines(time_period,data$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  dev.off()
}


