setwd("C:/Users/User/Documents/coursera/Data_Visualization")

housingData = read.table("./household_power_consumption.txt", sep=";", header = TRUE)
housingData$Date = as.Date(housingData$Date, "%d/%m/%Y")

# subset from 2007-02-01 to 2007-02-02

index1=grep("2007-02-01", housingData$Date) # will find first date
index2=grep("2007-02-02", housingData$Date) # will find indexes of second date
Data= housingData[index1[1]:index2[length(index2)],]

Data$finaldates=paste(Data$Date, Data$Time)
Data$Time = strptime(Data$finaldates,"%Y-%m-%d %H:%M:%OS")

# generates the plot
with(Data,{
    plot( Time, Sub_metering_1, type="n", ylab="Energy sub metering" )
    points( Time, as.numeric(as.character(Sub_metering_1)), type="l", col="black" )
    points( Time, as.numeric(as.character(Sub_metering_2)), type="l", col="red" )
    points( Time, as.numeric(as.character(Sub_metering_3)), type="l", col="blue" )
    
})

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                            pch="___", col= c("black","red","blue"))

dev.copy(png, file="plot3.png",width = 480, height = 480, units="px")
dev.off()
