setwd("C:/Users/User/Documents/coursera/Data_Visualization")

housingData = read.table("./household_power_consumption.txt", sep=";", header = TRUE)
housingData$Date = as.Date(housingData$Date, "%d/%m/%Y")

# subset from 2007-02-01 to 2007-02-02

index1=grep("2007-02-01", housingData$Date) # will find first date
index2=grep("2007-02-02", housingData$Date) # will find indexes of second date
Data= housingData[index1[1]:index2[length(index2)],]

Data$finaldates=paste(Data$Date, Data$Time) #combines date and time
Data$Time = strptime(Data$finaldates,"%Y-%m-%d %H:%M:%OS") # transforms into a date class

# generates the plot
plot(Data$Time, as.numeric(as.character(Data$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png",width = 480, height = 480, units="px")
dev.off()
