setwd("C:/Users/User/Documents/coursera/Data_Visualization")

housingData = read.table("./household_power_consumption.txt", sep=";", header = TRUE)
housingData$Date = as.Date(housingData$Date, "%d/%m/%Y")

# subset from 2007-02-01 to 2007-02-02

index1=grep("2007-02-01", housingData$Date) # will find first date
index2=grep("2007-02-02", housingData$Date) # will find indexes of second date
Data= housingData[index1[1]:index2[length(index2)],] # subset data 

var1=as.numeric(as.character(Data$Global_active_power)) # converts to numeric
hist(var1, xlab="Global active power (kilowats)", ylab="Frequency", col = "red", main= "Global Active Power")

dev.copy(png, file="plot1.png",width = 480, height = 480, units="px")
dev.off()
