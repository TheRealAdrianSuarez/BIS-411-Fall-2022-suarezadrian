# Data file not pushed to repo as per instructions   -10
# First, clear memory and the Console  

rm(list=ls(all=TRUE)) 
cat("\014") 

library(here) 
library(tidyverse) 
library (ggplot2)


# Import data into dataframe 
ukraine <- read_csv('Ukrainian_refugees.csv')

names(ukraine)[3] <- 'Number'


eur <- data.frame(Country = c ("Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden"))
n <-length(ukraine$Country)
for (i in 1:n) {
  if (ukraine$Country[i]%in% eur$Country){
    ukraine$eur[i]<-"YES"}
else {
  ukraine$eur[i]<-"NO"
}
}



final<-ggplot(data=ukraine, aes(x=reorder(Country,Number), y=Number, fill = eur)) +
  geom_col()+coord_flip()+
  geom_text(aes(label = Number), 
            position = position_dodge(width = 0.9),
            size = 3,
            hjust = -0.1) + scale_fill_manual(values=c("#999999","#003399"))+
  labs(x = "Country Fled To...",  
       y = "Number of Ukrainian Refugee", 
       title = "Sum of Ukrainian Refugees, Feb-Nov 2022",
       fill = "EU")+
  theme(legend.justification=c(1,0), legend.position=c(1,0))

final


