##Creating a plot based on a subset of NEI

CreatePlot2<-function(){
      
      #Load .RDS files from function bufferdata() which is in Plots_main.R script
      bufferdata()
      #Get a subset of NEI that holds values for fips equal to 24510 where 24510 describes baltimore 
      fipsbaltimore <- NEI[NEI$fips == "24510",]
      #Create an array which will hold the sum of Emissions by Year from the sumEmissions (NEI subset) Table
      sumEmissions <- tapply(fipsbaltimore$Emissions, fipsbaltimore$year, sum)
      #Select device PNG
      png(filename = "plot2.png", width = 480, height = 480, units = "px",bg = "white")
      par(mfrow = c(1,1), mar = c(4,4,2,2))
      barplot(sumEmissions,col = "thistle4", xlab = "Year", ylab = "PM2.5 Emission", main = "Total sum of emissions in Baltimore")
      dev.off()
      
}