#Function to plot a multiple graphs in 1 Figure

myplot<-function()
{  
  data<-read.table("household_power_consumption.txt",sep=";",colClasses="character",header=TRUE)
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  starts<-as.Date("2007-02-01")   
  ends<-as.Date("2007-02-02")
  data<-data[data$Date <= ends,]           #Subsetting the Dates for the required Time Periods
  data<-data[data$Date >= starts,]        
  time_period<-as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S") #converting the dates to POSIX object
  png("plot4.png",width=480,height=480)
  par(mfrow=c(2,2))  #used for plotting 2 x 2 graphs
  plot(time_period,data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  plot(time_period,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(time_period,data$Sub_metering_1,type="l",col="black",xlab="",ylab="Global Active Power(kilowatts)")
  lines(time_period,data$Sub_metering_2,col="red")
  lines(time_period,data$Sub_metering_3,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  plot(time_period,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  dev.off()  
}

