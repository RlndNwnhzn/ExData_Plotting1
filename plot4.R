setwd("./Exploratory Data Analysis/ProgrammingAssignment1")

# Read table, subset on specific dates and delete the (large) base table
df.tmp <- read.table("household_power_consumption.txt",header=TRUE,
                     sep=";",na.strings="?",stringsAsFactors=FALSE)
df.hpc <- subset(df.tmp,Date=="1/2/2007" | Date=="2/2/2007")
rm(df.tmp)

# Convert the Date and Time variables to Date/Time classes               
df.hpc$Date <- as.Date(df.hpc$Date,format="%d/%m/%Y")
df.hpc$Time <- as.POSIXlt(paste(df.hpc$Date,df.hpc$Time))

# Construct the plot and save it to a PNG file
png(file="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
# Upper left plot
with(df.hpc,plot(Time,Global_active_power,type="l",xlab="",
                 ylab="Global Active Power"
)
)

# Upper right plot
with(df.hpc,plot(Time,Voltage,type="l",xlab="datetime"))

# Lower left plot
with(df.hpc,plot(Time,Sub_metering_1,
                 xlab="",
                 ylab="Energy sub metering",
                 type="n")
)
with(df.hpc,lines(Time,Sub_metering_1,col="black"))
with(df.hpc,lines(Time,Sub_metering_2,col="red"))
with(df.hpc,lines(Time,Sub_metering_3,col="blue"))
legend("topright",bty="n",lty=c(1,1,1),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
) 

# Lower  right plot
with(df.hpc,plot(Time,Global_reactive_power,type="l",xlab="datetime"))

dev.off()


