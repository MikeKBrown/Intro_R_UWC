# DAY1_Laminaria Dataset exploring and learning
# Michael Brown
# 29 Jan 2019 

#loading libraries

library(tidyverse)
lam <- read.csv("data/laminaria.csv")
head(lam) # shows first six rows
tail(lam)

head(lam, n = 3)
tail(lam, n = 3)

lam_select <- lam %>% 
  select(site, total_length) %>% 
slice(54:80)

lam_kom <- lam %>% 
  filter(site == "Kommetjie") 

# In the laminaria dataset select only site and blade_length column
# Filter only for Sea Point

lam_try <- lam %>% 
  select(site, blade_length) %>% 
  filter(site == "Sea Point")
lam %>% 
  filter(total_length == max(total_length))

summary(lam)
dim(lam)

lam %>%  
  summarise(avrg_bl = mean(blade_length),
            med_bl = median(blade_length),
            sd_bl = sd(blade_length))# avrg_bl is a quick and easy annotation for mean blade length.

lam %>% 
  group_by(site) %>% 
  summarise(var_bl = var(blade_length),
            n = n()) %>% 
  mutate(se = sqrt(var_bl/n))

lam_2 <- lam %>% 
select(-blade_thickness, -blade_length)

lam %>% 
  select(stipe_mass) %>% 
  na.omit %>% 
  summarise(n = n())

lam %>% 
  select(blade_length) %>% 
  summarise(n = n())

lam %>% 
  select(blade_length) %>% 
  na.omit %>% 
  summarise(n = n())

lam %>% 
  select(blade_weight) %>% 
  summarise(n = n()) 
  
  lam %>% 
  select(blade_weight) %>% 
  na.omit %>% 
  summarise(n = n())
  
  ggplot(data = lam, aes(x = stipe_mass, y = stipe_length)) +
    geom_point(shape = 21, colour = "green", fill = "white") +
    labs(x = "Stipe mass (kg)", y = "Stipe length (cm)")
  ## Exercise:
  
 # 1. Create a new data frame from the `laminaria` dataset that meets the following criteria: contains only the `site` column and a new column called `total_length_half` containing values that are half of the `total_length`. In this `total_length_half` column, there are no `NA`s and all values are less than 100.
 # **Hint**: think about how the commands should be ordered to produce this data frame!
    
   # 2. Use `group_by()` and `summarize()` to find the mean, min, and max blade_length for each site. Also add the number of observations (hint: see `?n`).
  
  #3. What was the heaviest stipe measured in each site? Return the columns `site`, `region`, and `stipe_length`.
  
  lam_exercise_1 <- lam %>% 
    mutate(total_length_half = (total_length/2)) %>% 
    na.omit %>% 
   filter(total_length_half<100) %>% 
    select(site, total_length_half) 

  lam_exercise_2 <- lam %>% 
    group_by(site) %>% 
  summarise(avrg_bl = mean(blade_length),
            minimum_bl = min(blade_length),
            maximum_bl = max(blade_length),
            n = n())
  
lam_exercise_3 <- lam %>%   
  group_by(site) %>% 
  filter(stipe_mass == max(stipe_mass)) %>% 
  select(site, region, stipe_length)

  