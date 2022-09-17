#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
#variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot
#answer this question.


CreatePlot3<-function(){
      
      #Load .RDS files from function bufferdata() which is in Plots_main.R script
      bufferdata()
      #Get a subset of NEI that holds values for fips equal to 24510 where 24510 describes baltimore 
      fipsbaltimore <- NEI[NEI$fips == "24510",]
      #Compute summary emmissions by year + type on our baltimore subset
      tempdata <- aggregate(Emissions ~ year + type, fipsbaltimore, sum)
      #Select device PNG
      png(filename = "plot3.png", width = 640, height = 480, units = "px",bg = "white")
      par(mfrow = c(1,1), mar = c(4,4,2,2))
      plot3p <- ggplot(tempdata, aes(year, Emissions,color = type)) + geom_point() + geom_smooth(formula = y~x,method="loess",se=TRUE) + ggtitle("Summary of Emissions per type in Baltimore through the years") + xlab("Year") + ylab("Total PM2.5 Emissions") 
      print(plot3p)
      dev.off()
      
}