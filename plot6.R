#Compare emissions from motor vehicle sources in Baltimore City with 
#emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
#Which city has seen greater changes over time in motor vehicle emissions?

CreatePlot6<-function(){
      
      #Load .RDS files from function bufferdata() which is in Plots_main.R script
      bufferdata()
      #find indices with the word *Vehicles* in the merged data (We search in SCC.Level.Two)
      vehiclesetID<- grep("vehicles", MERGEDDATA$SCC.Level.Two, ignore.case = TRUE)
      vehicleset <- MERGEDDATA[vehiclesetID,]
      
      #Create a set for Baltimore
      baltimoreset <- vehicleset[vehicleset$fips == "24510",]
      baltimoreset<-aggregate(Emissions ~ year, baltimoreset, sum)
      baltimoreset <- cbind(baltimoreset, "baltimore")
      colnames(baltimoreset)<-c("year","Emissions","City")
      #Create a set for Los Angeles
      losangelesset <- vehicleset[vehicleset$fips == "06037",]
      losangelesset<-aggregate(Emissions ~ year, losangelesset, sum)
      losangelesset <- cbind(losangelesset, "los-angeles")
      colnames(losangelesset)<-c("year","Emissions","City")

      cityset<-rbind(baltimoreset,losangelesset)

      #Select device PNG
      png(filename = "plot6.png", width = 640, height = 480, units = "px",bg = "white")
      par(mfrow = c(1,1), mar = c(4,4,2,2))
      plot6p <- ggplot(cityset, aes(year, Emissions, color = City)) + geom_point() + geom_line() + ggtitle("Summary of Emissions (from vehicles) in Baltimore and LA through the years") + xlab("Year") + ylab("Total PM2.5 Emissions") 
      print(plot6p)
      dev.off()

}