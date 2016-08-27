## Exploratory Data Analysis - Assignment 1, Plot 1
# Aron O'Connor
# August 26, 2016

#Read the data into R from the text file
energy_df <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                        na.strings="?",col.names=c("date","time","global_active_power",
                        "global_reactive_power","voltage","global_intensity",
                        "sub_metering_kitchen","sub_metering_laundry","sub_metering_ac"))

#Subset the data so that only Feb. 1-2, 2007 is included in the new data frame.
energy <- energy_df[66637:69516,]

#Export the plot at a png file.
png(file = "plot1.png",width=480,height=480)

#Create a histogram of the data with specific formatting.
hist(energy$global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency",main="Global Active Power",xaxp=c(0,6,3),yaxp=c(0,1200,6))

dev.off()
