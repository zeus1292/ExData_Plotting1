#Code for plotting Histogram for Global Active Power

myplot<-function()
{
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
  data$Date<-as.Date(data$Date,format="%d/%m/%Y")
  starts<-as.Date("2007-02-01",format="%Y-%m-%d")
  ends<-as.Date("2007-02-02",format="%Y-%m-%d")
  data<-data[data$Date >= starts, ] 
  data<-data[data$Date <= ends, ]
  data$Time<-strptime(data$Time,format="%H:%M:%S")
  data$Global_active_power<-as.numeric(data$Global_active_power)
  png("plot1.png")
  hist(data$Global_active_power,freq=TRUE,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
  dev.off()
}