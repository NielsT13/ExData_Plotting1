getwd()
setwd("C:/Users/niels.tooth/Documents/Coursera/ExData_Plotting1")

#Get Data and transform Date and Time
mydata=read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
mydata$Date=as.Date(mydata$Date, "%d/%m/%Y")
mysubset=subset(mydata, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
mysubset$Time=format(strptime(mysubset$Time, format= "%H:%M:%S"),"%H:%M:%S")
mysubset$DateTime=as.POSIXct(paste(mysubset$Date, mysubset$Time), format="%Y-%m-%d %H:%M:%S")

#Make plot out of Energy sub metering over time
png("plot3.png", width = 480,height = 480)

plot(x=mysubset$DateTime,y=as.numeric(levels(mysubset$Sub_metering_1))[mysubset$Sub_metering_1],type="l",col="black", ylab="Energy sub metering", xlab="")
lines(x=mysubset$DateTime,y=as.numeric(levels(mysubset$Sub_metering_2))[mysubset$Sub_metering_2],col="red")
lines(x=mysubset$DateTime,y=mysubset$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)

dev.off()
