##All Plots - Clean Data
  ## Read in data and address NA symbol to prevent problems in numeric conversion.
    data<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

  ## Format appropriate columns as character and numeric.
    data$Date <- as.character(data$Date)
    data$Time <- as.character(data$Time)
    cols <- c(3:9) 
    data[,cols] <- as.numeric(unlist(data[,cols]))

  ## Convert dates and times to POSIX class.
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data$Time <- paste(data$Date, data$Time, sep=" ")
    data$Time <- strptime(data$Time, "%Y-%m-%d %H:%M:%S")

  ## Subset data to the specified dates.
    febdata <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

##  Plot 4
  ## Open PNG device to create new file.
    png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
    
  ## Create plotting 'matrix.'
    par(mfcol = c(2,2))
    
  ## Recreate plot 2 with new y label (top left).
    plot(febdata$Time, febdata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
    
  ## Recreate plot 3 with no border on legend (bottom left).
    plot(febdata$Time, febdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    lines(febdata$Time, febdata$Sub_metering_2, xlab = "", ylab = "", type = "l", col = "red")
    lines(febdata$Time, febdata$Sub_metering_3, xlab = "", ylab = "", type = "l", col = "blue")
    legend("topright", bty = "n", lty="solid", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  ## Create new plot 4a (top right).
    plot(febdata$Time, febdata$Voltage, xlab = " datetime ", ylab = "Voltage", type = "l")
    
  ## Create new plot 4b (bottom right).
    plot(febdata$Time, febdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
    
  ## Close graphic device to complete file.
    dev.off()
    