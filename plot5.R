
CreatePlot5<-function(){
      
      #Load .RDS files from function bufferdata() which is in Plots_main.R script
      bufferdata()
      #find indices with the word *Vehicles* in the merged data (We search in SCC.Level.Two)
      vehiclesetID<- grep("vehicles", MERGEDDATA$SCC.Level.Two, ignore.case = TRUE)
      vehicleset <- MERGEDDATA[vehiclesetID,]
      vehicleset <- vehicleset[vehicleset$fips == "24510",]
      vehicleset <- tapply(vehicleset$Emissions, vehicleset$year, sum)
      #Select device PNG
      png(filename = "plot5.png", width = 480, height = 480, units = "px",bg = "white")
      par(mfrow = c(1,1), mar = c(4,4,2,2))
      barplot(vehicleset,col = "thistle4", xlab = "Year", ylab = "PM2.5 Emission", main = "Total sum of emissions from vehicles in Baltimore")
      dev.off()
      
}