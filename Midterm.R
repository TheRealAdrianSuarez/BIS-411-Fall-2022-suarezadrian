#1 Import the data into a data frame.

library(here)
library(tidyverse)
netflix <- read_csv(here("netflix_titles.csv"))


#2 Filter the data set down so that it contains only rows with type equal to "Movie"
movies <- netflix %>% filter(type=="Movie")

#3 Replace any ratings equal to "84 min", "74 min", "66 min", "NR", or "UR" with the general term "Unrated"
library(dplyr)
movies <- movies %>% 
  mutate(rating = str_replace_all(rating, "NR", "Unrated")) %>% 
  mutate(rating = str_replace_all(rating, "UR", "Unrated")) %>% 
  mutate(rating = str_replace_all(rating, "84 min", "Unrated")) %>% 
  mutate(rating = str_replace_all(rating, "74 min", "Unrated")) %>% 
  mutate(rating = str_replace_all(rating, "66 min", "Unrated")) 

#4 Categorize all ratings of "PG", "PG-13", "G", "TV-G", "TV-PG" , "TV-Y", "TV-Y7", or "TV-Y7-FV" as being "Appropriate for 13 and Under". Categorize all other ratings as "NOT Appropriate for 13 and Under".

movies <- movies %>% mutate(Appropriateness = NA)
movies$Appropriateness[str_detect(movies$rating, "PG")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "PG-13")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "G")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-G")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-PG")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-Y")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-Y7")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-Y7-FV")] <- "Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "R")] <- "NOT Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-MA")] <- "NOT Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "NC-17")] <- "NOT Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "TV-14")] <- "NOT Appropriate for 13 and Under"
movies$Appropriateness[str_detect(movies$rating, "Unrated")] <- "NOT Appropriate for 13 and Under"

#5 Use the data from step 4 to create a graph as shown above.
movies %>%
  filter(!is.na(Appropriateness)) %>%
ggplot(aes(x = Appropriateness, fill = rating)) +
  ggtitle("Breakdown of Netflix Movies Appropriateness for 13-Year-Old") +
  labs(y = "Movies")+
  geom_bar()
