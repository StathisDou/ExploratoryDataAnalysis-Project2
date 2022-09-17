## Create plot 1 script file

CreatePlot1<-function(){
      #Load .RDS files from function bufferdata() which is in Plots_main.R script
      bufferdata()
      #Create an array which will hold the sum of Emissions by Year from the NEI Table
      sumEmissions <- tapply(NEI$Emissions, NEI$year, sum)
      #Select device PNG
      png(filename = "plot1.png", width = 480, height = 480, units = "px",bg = "white")
      par(mfrow = c(1,1), mar = c(4,4,2,2))
      barplot(sumEmissions,col = "thistle4", xlab = "Year", ylab = "PM2.5 Emission", main = "Total sum of emissions per year")
      dev.off()
}