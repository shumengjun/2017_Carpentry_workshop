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
  