getwd()
setwd("C:/Users/niels.tooth/Documents/Coursera/ExData_Plotting1")

#Get Data and transform Date and Time
mydata=read.csv("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
mydata$Date=as.Date(mydata$Date, "%d/%m/%Y")
mysubset=subset(mydata, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
mysubset$Time=format(strptime(mysubset$Time, format= "%H:%M:%S"),"%H:%M:%S")

#Make Histogram out of Global Active Power in Kilowatts
png("plot1.png", width = 480,height = 480)

hist(as.numeric(levels(mysubset$Global_active_power))[mysubset$Global_active_power], col = "Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()