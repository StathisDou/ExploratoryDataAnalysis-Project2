
CreatePlot4<-function(){
      
      #Load .RDS files from function bufferdata() which is in Plots_main.R script
      bufferdata()
      #get indices where (Short name) contains the word coal from SCC
      containscoalID <- grep("coal", MERGEDDATA$Short.Name, ignore.case = TRUE)
      containscoal <- MERGEDDATA[containscoalID,]
      containscoal <- aggregate(Emissions ~ year, containscoal, sum) 
      #Select device PNG
      png(filename = "plot4.png", width = 640, height = 480, units = "px",bg = "white")
      par(mfrow = c(1,1), mar = c(4,4,2,2))
      plot4p <- ggplot(containscoal, aes(year, Emissions)) + geom_point() + geom_line() + ggtitle("Summary of Emissions from Coal Combustion related emissions") + xlab("Year") + ylab("Total PM2.5 Emissions") 
      print(plot4p)
      dev.off()
      
}