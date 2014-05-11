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
par(mar=c(3, 5, 2, 2))
plot(hpc$date.time , hpc$Global_active_power,
     xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, file = "./figure/plot2.png") ## Copy my plot to a PNG file
dev.off()