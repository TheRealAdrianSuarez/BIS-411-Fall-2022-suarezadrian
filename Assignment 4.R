library(tidyverse)
library(here)
library(ggplot2)
library(gridExtra)
tanks <- read_csv(here("WOT.csv"))

tanks$WR <- as.numeric(sub("%","",tanks$WR))
tanks<-tanks[tanks$Battles>3,]

nationplot <- ggplot(tanks, aes(x=reorder(Nation,WR), y=WR,)) + 
  labs(x= "Nation Played", y= "Win Rate (WR)", title = "Stats by Nation Played") +
  geom_boxplot() 
nationplot

#**scale_x_discrete(limits=c("2", "0.5", "1"))
typeplot <- ggplot(tanks, aes(x=reorder(Class,WR), y=WR,)) + 
  labs(x= "Type Played", y= "Win Rate (WR)", title = "Stats by Type Played") +
  geom_boxplot() 
typeplot

gridExtra:: grid.arrange( 
  nationplot,
  typeplot,
  ncol = 2
)