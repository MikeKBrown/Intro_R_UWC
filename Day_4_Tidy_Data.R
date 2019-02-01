#Tidy Data
#Day 4
#Michael Brown
#01 February 2019

#setup
load("data/SACTN_mangled.RData")
library(tidyverse)
library(ggplot2)

#Multiple Graph lines
ggplot(SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site,src))) + #paste0 allows you to group data by multiple variables
  labs(x = "Date", y = "Temperature (°C)") +
  ggtitle("SACTN Data")

#gather
SACTN2_tidy <- SACTN2 %>% 
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") #Gather function groups multiple columns into 1, creates tidy data.

#spreading
SACTN3_tidy <- SACTN3 %>% 
  spread(key = var, value = val)

#separating
SACTN4a_tidy <- SACTN4a %>% 
  separate(col = index, into = c("site", "src"), sep = "/ ")

#uniting
SACTN4b_tidy <- SACTN4b %>% 
  unite(year, month, day, col = "date", sep = "-")

#joining
SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy) # this joins data next to each other, using the first three columns (site, src, date) as a reference
