#DAy 4
# Tidy data 2.0
#1 Feb 2019
#Michael Brown

#Load Libraries
library(lubridate)

#Load Data
load("data/SACTNmonthly_v4.0.RData")

#Make a shorter name
SACTN <- SACTNmonthly_v4.0

#Remove original file
rm(SACTNmonthly_v4.0)

SACTN %>% 
  filter(site == "Amanzimtoti") #extracting only Amanzimtoti

SACTN %>% 
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1) #december or january

SACTN %>% 
  arrange(depth, temp) #sorts depth and temp in ascending order

SACTN %>% 
  arrange(desc(temp)) # does the same thing but in descending order 

SACTN %>% 
  filter(site == "Humewood", year(date) == 1990)

SACTN %>% 
  filter(site == "Humewood", year(date) == 1991) #tried with a different day


humewood_90s <- SACTN %>% 
  filter(site == "Humewood", year(date) %in% seq(1990, 1999, 1))

SACTN %>% 
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp)) # Include missing values

select_1 <- SACTN %>%
select(site, src, date, temp) #select columns by date


select_2 <- SACTN %>%  #select columns in sequence
  select(site:temp)


select_3 <- SACTN %>% #Select columns excluding two.
  select(-date, -depth)

select_4 <- SACTN %>% #select columns except those within a given sequence
  select(-(date:depth))

Kelvin <- SACTN %>% 
  mutate(kelvin = temp + 273.15)

SACTN %>% 
  summarise(mean_temp = mean(temp, na.rm = TRUE))

SACTN %>% 
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE)
  )

# Great commenting
# Tried different things other than just copying what was taught in class
# EXplored
