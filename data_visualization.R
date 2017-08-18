## Data visualization

library(tidyverse)

surveys_complete <- read.csv("data_output/surveys_complete.csv")


##ggplot2

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) + 
  geom_point(alpha = 0.5, aes(color = species_id))


## challenge 1
ggplot(data = surveys_complete, aes(x = species_id, y = weight)) + 
  geom_point(alpha = 0.5, aes(color = plot_type))

##boxplot instead of scatter
ggplot(data = surveys_complete, aes(x = species_id, y = weight)) + 
  geom_boxplot(aes(color = plot_type)) + 
  labs(x = "species",
       y = "weight",
       title = "plot") +
  theme(plot.title = element_text(hjust = 0.5))
  
  
## time series

yearly_counts <- surveys_complete %>%
  group_by(year, species_id) %>%
  tally
  
ggplot(data = yearly_counts, aes(x = year, y = n, color = species_id, group = species_id)) +
  geom_line() + 
 

 facet_wrap(~ species_id)yearly_sex_count <- surveys_complete %>%
  group_by(year, species_id, sex) %>%
  tally
  
ggplot(data = yearly_sex_count, aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id)
  
  
 ## challenge 2

yearly_average_weight <- surveys_complete %>%
  group_by(year, species_id) %>%
  summarize(mean_weight = mean(weight))
  
my_plot <- ggplot(data = yearly_average_weight, aes(x= year, y = mean_weight, color = species_id)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(x = "year",
       y = "Mean Weight (g)") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90), legend.position = "none")
  

##save the plot
my_plot
ggsave("my_plot.png", my_plot, width = 15, height = 10)
  
  
  
  
  
  
  
  
  
  