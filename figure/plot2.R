#Function to plot a line graph

myplot<-function()
{  
  data<-read.table("household_power_consumption.txt",sep=";",colClasses="character",header=TRUE)
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  starts<-as.Date("2007-02-01")   
  ends<-as.Date("2007-02-02")
  data<-data[data$Date <= ends,]           #Subsetting the Dates for the required Time Periods
  data<-data[data$Date >= starts,]        
  time_period<-as.POSIXct(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S") #converting the dates to POSIX object
  png("plot2.png",width=480,height=480)
  plot(time_period,t$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  dev.off()
}