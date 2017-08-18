surveys <- read.csv("data/portal_data_joined.csv")

install.packages("tidyverse")
library(tidyverse)


##select the columns
select(surveys, plot_id, species_id, weight)

## selet rows
filter(surveys, year == 1995)

##pipes
## This is a pipe  %>%
survey_sml <- surveys %>%
  filter(year == 1995) %>% ## filter is for rows
  select(year, plot_id, species_id, weight) ## select is for columns

##
surveys %>%
  mutate(weight_kg = weight / 1000, ## mutate is for add columns
         weogjt_kg2 = weight_kg * 2) %>% ## add another column
  tail
  

## remove na
surveys %>%
  filter(!is.na(weight)) %>% ## remove NA
  mutate(weight_kg = weight / 1000,
         weogjt_kg2 = weight_kg * 2) %>%
  head

## challenge
challenge1 <- surveys %>%
  mutate(hindfoot_half = hindfoot_length /2 ) %>%
  filter(!is.na(hindfoot_half), hindfoot_half < 30) %>%
  select(species_id, hindfoot_half)
head(challenge1)


## group by and summarize
surveys %>%
  filter(!is.na(weight),
         sex == "M" | sex =="F") %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight),
            min_weight = min(weight))

## tally count the total number of observations for the variable
surveys %>%
  group_by(sex) %>%
  tally


## challenge 2

##  q1
surveys %>%
  group_by(plot_type) %>%
  tally

##Q2
surveys %>%
  filter(!is.na(hindfoot_length)) %>%
  group_by(species_id) %>%
  summarize(mean_fl = mean(hindfoot_length),
            min_fl = mean(hindfoot_length),
            max_fl = max(hindfoot_length))
  
##Q3
surveys %>%
  select(year, genus, species_id, weight) %>%
  group_by(year) %>%
  top_n(1, weight) %>%
  arrange(year)

##Q4
surveys %>%
  filter(sex == "M" | sex =="F") %>%
  group_by(sex) %>%
  summarize(n())

## export data

surveys_complete <- surveys %>%
  filter(species_id != " ") %>% ## remove missing species id
  filter(!is.na(weight)) %>%
  filter(!is.na(hindfoot_length)) %>%
  filter(sex != "")


##concise way

surveys_complete <- surveys %>%
  filter(species_id != "",
         !is.na(weight),
         !is.na(hindfoot_length),
         sex != "")

## extract the most common species_id

species_count <- surveys_complete %>%
  group_by(species_id) %>%
  tally %>%
  filter( n >= 50 )


## only keep the most common species

surveys_comm_spp <- surveys_complete %>%
  filter(species_id %in% species_count$species_id) ## %in% means match

write.csv(surveys_comm_spp, file = "data_output/surveys_complete.csv")



























