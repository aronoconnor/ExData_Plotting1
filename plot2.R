## Exploratory Data Analysis - Assignment 1, Plot 2
# Aron O'Connor
# August 26, 2016

#Read the data into R from the text file
energy_df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                        na.strings="?",col.names=c("date","time","global_active_power",
                        "global_reactive_power","voltage","global_intensity",
                        "sub_metering_kitchen","sub_metering_laundry","sub_metering_ac"))

#Subset the data so that only Feb. 1-2, 2007 is included in the new data frame.
energy <- energy_df[66637:69516,]

#Combine the date and time columns into one.  Convert this column to an R date/time format.
energy$dateTime <- paste(energy$date,energy$time,sep=" ")
energy$dateTime <- strptime(energy$dateTime,format="%d/%m/%Y %H:%M:%S")

#Initiate png file
png(file="plot2.png",width=480,height=480)

#Plot the data and format
plot(energy$dateTime,energy$global_active_power,type="l",xlab=" ",ylab="Global 
     Active Power (kilowatts)")

dev.off()

