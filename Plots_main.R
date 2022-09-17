
NEI<-0
SCC<-0

bufferdata<-function(){
      NEI <<- readRDS("summarySCC_PM25.rds")
      SCC <<- readRDS("Source_Classification_Code.rds")
}