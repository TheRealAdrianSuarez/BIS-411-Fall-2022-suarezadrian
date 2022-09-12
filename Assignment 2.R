data <- read.csv("covid-19-data/us-states.csv")
data 
library(dplyr)
penn <-data %>% filter(state == "Pennsylvania")

incr_cases <-diff(penn$cases)
incr_deaths<-diff(penn$deaths)

sd(incr_cases)

