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
png(file="plot2.png",width=480,height=480,units="px")
with(df.hpc,plot(Time,Global_active_power,
                 xlab="",
                 ylab="Global Active Power (kilowatts)",
                 type="n"
)
)
with(df.hpc,lines(Time,Global_active_power))
dev.off()     
