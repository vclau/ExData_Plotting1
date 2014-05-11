setwd ("~/Dropbox/R Prog/Exploratory Data/ExData_Plotting1/")
### Way 1: Read all variables as character with colClasses
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, 
                  sep = ";", colClasses="character",
                  col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))

## convert any "?" to "NA"
for( i in 1:9) {
  hpc[hpc[, i] == "?"] <- "NA"
}

## convert power measurements to numeric
for(i in 3:9){
  hpc[, i] <- as.numeric(hpc[, i])
}

date.time <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
hpc<-cbind(date.time,hpc)





par(mfcol = c(2, 2), mar = c(4, 4, 1, 1))
with(hpc, {
  
  #GRAPH 1
  plot(hpc$date.time , hpc$Global_active_power,
       xlab="", ylab="Global Active Power", type="l", cex.axis=.8, cex.lab=.8)
  
  #GRAPH 2
  
  plot(hpc$date.time, hpc$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", cex.axis=.8, cex.lab=.8)
  
  lines(hpc$date.time,hpc$Sub_metering_2, type="l",col="red")
  lines(hpc$date.time,hpc$Sub_metering_3, type="l",col="blue")
  
  legend("topright", c("sub_metering_1","sub_metering_2", "sub_metering_3"), cex=0.4, 
         col=c("black","red","blue"),  lty=1);
 
  #GRAPH 3
  
  plot(hpc$date.time , hpc$Voltage,
       xlab="datetime", ylab="Voltage", type="l", cex.axis=.8, cex.lab=.8)
  
  #GRAPH 4
  plot(hpc$date.time ,hpc$Global_reactive_power ,
       xlab="datetime", ylab="Global_reactive_power", type="l", cex.axis=.8, cex.lab=.8)
})


dev.copy(png, file = "./figure/plot4.png") ## Copy my plot to a PNG file
dev.off()