## Data visualization

library(tidyverse)

surveys_complete <- read.csv("data_output/surveys_complete.csv")


##ggplot2

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.5, aes(color = species_id))


## challenge
ggplot(data = surveys_complete, aes(x = species_id, y = weight)) + 
  geom_point(alpha = 0.5, aes(color = plot_type))
