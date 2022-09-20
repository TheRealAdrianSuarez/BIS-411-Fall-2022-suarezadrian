data <- read.csv("covid-19-data/us-states.csv")
data 
library(dplyr)
penn <-data %>% filter(state == "Pennsylvania")

incr_cases <-diff(penn$cases)

# TAA Failed to calculate row 1 as per different approach   -10

incr_deaths<-diff(penn$deaths)

sd(incr_cases)

