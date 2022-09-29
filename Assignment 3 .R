#1 
install.packages("here")
library(here)
here::here()
Live <- read.csv(here("Covid-19-data", "us-counties.csv"))
Recent <- read.csv(here("covid-19-data", "us-counties-recent.csv"))
counties2020 <- read.csv(here("covid-19-data", "us-counties-2020.csv"))
counties2021 <- read.csv(here("covid-19-data","us-counties-2021.csv"))
counties2022 <- read.csv(here("covid-19-data","us-counties-2022.csv"))

Counties <- rbind(counties2020,counties2021, counties2022, Recent, Live)

#2 
library(dplyr)
sample <- filter(county == "Lehigh" & state == "Pennsylvania")%>%
  
  distinct date
  Counties
Counties_distinct          distinct () %>%
          filter(county == "Lehigh" & state == "Pennsylvania")%>%
          mutate (incr_cases = (cases-lag(cases)))
#3
library(ggplot2)
p <- ggplot(data = sample,
            mapping = aes(x = date,
                          y = incr_cases,
                          group = 1))
p + geom_line(color="blue")+
    labs(x = "Date", y = "New Cases Reported sample",
       title = "COVID-19 Cases Reported in Lehigh, PA")

