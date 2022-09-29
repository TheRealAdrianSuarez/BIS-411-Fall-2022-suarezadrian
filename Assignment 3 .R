#Updated Assignment 3

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
library(tidyverse)
sample_filter <- filter(Counties, county == "Lehigh" & state == "Pennsylvania")
sample_distinct <- distinct(sample_filter, date, .keep_all = TRUE)
sample_mutate <- mutate (sample_distinct, incr_cases = (cases-lag(cases)))

#3
library(ggplot2)
p <- ggplot(data = sample_mutate,
            mapping = aes(x = date,
                          y = incr_cases))
p + geom_line(color="blue")+
    labs(x = "Date", y = "New Cases Reported",
       title = "COVID-19 Cases Reported in Lehigh, PA")

