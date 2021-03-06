#Load Data and Create Plot 1

dataSet <- read.table("household_power_consumption.txt",
                      col.names = c("Date","Time","Global_active_power",
                                    "Global_reactive_power",
                                    "Voltage","Global_intensity",
                                    "Sub_metering_1","Sub_metering_2",
                                    "Sub_metering_3"),
                      sep = ";",
                      skip = 66637, # 2007/2/1 
                      nrows = 2880, # 2007/2/2
                      na.strings ="?")

#Convert to specific Classes

dataSet$Time <- strptime(paste(dataSet$Date, dataSet$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dataSet$Date <- as.Date(dataSet$Date,"%d/%m/%Y")

# create File

png("plot3.png") 

#Create Plot

with(dataSet,
        plot(Time,Sub_metering_1, 
             type =  "l", 
             xlab = "", 
             ylab = "Energy sub metering", 
             col = "black")
)

lines(dataSet$Time,dataSet$Sub_metering_2, col = "red")

lines(dataSet$Time,dataSet$Sub_metering_3, col = "blue")

legend("topright", 
        pch = c("-","-","-"),
        col = c("black","red","blue"),
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Close File
dev.off()