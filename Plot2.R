getwd()
setwd("C:/Users/niels.tooth/Documents/Coursera/ExData_Plotting1")

#Get Data and transform Date and Time
mydata=read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
mydata$Date=as.Date(mydata$Date, "%d/%m/%Y")
mysubset=subset(mydata, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
mysubset$Time=format(strptime(mysubset$Time, format= "%H:%M:%S"),"%H:%M:%S")
mysubset$DateTime=as.POSIXct(paste(mysubset$Date, mysubset$Time), format="%Y-%m-%d %H:%M:%S")

#Make plot out of Global Active Power in Kilowatts over time
png("plot2.png", width = 480,height = 480)

plot(y=(as.numeric(levels(mysubset$Global_active_power)))[mysubset$Global_active_power], x=mysubset$DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()