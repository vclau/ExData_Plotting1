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
par(mar=c(4, 4, 2, 1))
hist(hpc$Global_active_power, main="Global active power", 
        xlab="Global Active Power (kilowatts)", ylab="Frequency",col = "red",cex.lab=.8)
dev.copy(png, file = "./figure/plot1.png") ## Copy my plot to a PNG file
dev.off()