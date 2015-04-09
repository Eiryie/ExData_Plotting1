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

##  Plot 1
  ## Open PNG device to create new file.
    png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

  ## Create plot with appropriate title, labels, and colors.
    ## Note: color may appear to vary depending on screen resolution.  
    ## The selected hex color matches the RGB values of the original (obtained by using MS Paint).
    hist(febdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "#FB0007")

  ## Close graphic device to complete file.
    dev.off()
