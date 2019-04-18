#basic_stats
#09/04/2019
#Michael Brown
#First Script
#AJ teaching

library(tidyverse)

chicks <- as_tibble(ChickWeight)

head(chicks) #first 6 rows

tail(chicks, n = 2) #last 2 rows

colnames(chicks) #names of columns

dim(chicks) #dimensions of data

summary(chicks) #summarises the data

ncol(chicks) #number of columns

glimpse(chicks)

mean(chicks$weight) #mean weight of chicks

chicks %>% 
  filter(Time == 0) %>% 
  group_by(Diet) %>% 
  summarise(mean_wt = mean(weight), #don't forget the summarise function
            sd_wt = sd(weight)) 
  
nums <- c(14, 667, 18, 765, 35, 15)

(14+667+18+765+35+15)/6 #long

sum(nums)/length(nums)  #shorter
  
mean(nums) #shortest
  
round(mean(chicks$weight), 1)

vals <- c(12, 14, 18, 555, NA , 36)  

mean(vals)

mean(vals, na.rm = TRUE)


nums2 <- c(5,2,6,13,1)
mean(nums2)
median(nums2)

nums3 <- c(5,2,6,1000,1)  
mean(nums3)
median(nums3)

mean(chicks$weight)  
median(chicks$weight)

sd(chicks$weight) #shortest way to find the standard dev

chicks %>% 
  summarise(min_wt = min(weight),
            qrt1_wt = quantile(weight, p = 0.25),
            med_wt = median(weight),
            qrt3_wt = quantile(weight, p = 0.75),
            max_wt = max(weight))
range(chicks$weight)

summary(chicks$weight)

chick1 <- chicks %>% 
  filter(Time <= 10) %>% 
  group_by(Time, Diet) %>% 
  summarise(min(weight),
            quantile(weight, p = 0.25),
            median(weight),
            mean(weight),
            quantile(weight, p = 0.75),
            max(weight))
  