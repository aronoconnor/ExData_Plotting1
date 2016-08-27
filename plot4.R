## Exploratory Data Analysis - Assignment 1, Plot 4
# Aron O'Connor
# August 26, 2016

#Read the data into R from the text file
energy_df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                        na.strings="?",col.names=c("date","time","global_active_power",
                                                   "global_reactive_power","voltage","global_intensity",
                                                   "sub_metering_1","sub_metering_2","sub_metering_3"))

#Subset the data so that only Feb. 1-2, 2007 is included in the new data frame.
energy <- energy_df[66637:69516,]

#Combine the date and time columns into one.  Convert this column to an R date/time format.
energy$dateTime <- paste(energy$date,energy$time,sep=" ")
energy$dateTime <- strptime(energy$dateTime,format="%d/%m/%Y %H:%M:%S")

#Initiate png file
png(file="plot4.png",width=480,height=480)

#Plot the data and format
par(mfrow=c(2,2))
plot(energy$dateTime,energy$global_active_power,type="l",xlab=" ",ylab="Global 
     Active Power (kilowatts)")
plot(energy$dateTime,energy$voltage,type="l",xlab="datetime",ylab="Voltage")
plot(energy$dateTime,energy$sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
lines(energy$dateTime,energy$sub_metering_2,col="red")
lines(energy$dateTime,energy$sub_metering_3,col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c(
        "black","red","blue"),lty=1,bty="n")
plot(energy$dateTime,energy$global_reactive_power,type="l",xlab="datetime",ylab=
         "Global_reactive_power",yaxp=c(0.0,0.5,5))

dev.off()



