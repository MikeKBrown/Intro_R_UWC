# Exercise 3
# 04/02/2019
# Michael Brown

#load libraries
library(tidyverse)
library(ggpubr)
library(lubridate)

#load data
day_1 <- read.csv("data/SACTN_day_1.csv")

#graph

ggplot(day_1, aes(x = date, y = temp, colour = site)) +
  geom_line(aes(group = site)) +
  labs(x = "Date", y = "Temperature", colour = "Site") +
  ggtitle("Daily Temperature Fluctuations by Site")

#Selecting Temperatures during specific months at Port Nolloth

day_1 %>% 
  filter(site == "Port Nolloth", month(date) == 9 | month(date) == 8) %>% 
  select(temp)
#filtering for only Port Nolloth
#Filtering for only September and August using date function
#selecting for temp

#selecting temperatures during 1994 in port nolloth

day_1 %>% 
  filter(site == "Port Nolloth", year(date) == 1994) %>% 
  select(temp)
#filtering for only Port Nolloth in 1994
#selecting temp

#Average by Depth, no depth
day_1 %>% 
  group_by(depth) %>% 
  summarise(avrg_temp = mean(temp)) #(in theory)





  


  

