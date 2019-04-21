#Egg Breadth Plot
#Michael Brown
#07 Feb 2019

#Load Libraries
library(tidyverse)
library(ggpubr)
library(lubridate)
library(readr)

#read data
egg_1 <- read_delim("data/YearlyEggBreadths.csv", 
                                ";", escape_double = FALSE, trim_ws = TRUE)

egg_1 <- YearlyEggBreadths
egg_2 <- egg_1 %>% slice(1:12)


  egg_3 <- egg_2 %>% 
  mutate(Months_1 = c(01:12))



#Plotting
ggplot(egg_3, aes(x = Months_1))+
  geom_path(aes(y = AveragesMinBreadth1)) +
  geom_path(aes(y = AveragesMinBreadth2), colour = "orange") +
  labs(x = "Months", y = "Egg Breadth (mm)") +
  geom_errorbar(aes(ymax = AveragesMinBreadth1 + as.numeric(StdDevMinBreadth1), 
                    ymin = AveragesMinBreadth1 - as.numeric(StdDevMinBreadth1)), width = 0.1) +
  geom_errorbar(aes(ymax = AveragesMinBreadth2 + as.numeric(StdDevMinBreadth2), 
                    ymin = AveragesMinBreadth2 - as.numeric(StdDevMinBreadth2)), width = 0.1, colour = "orange") +
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sepr", "Oct", "Nov", "Dec"))+
  scale_y_continuous(breaks = c(10, 20, 30, 40, 50, 60, 70), labels = c("10", "20", "30", "40", "50", "60", "70"))



  
 

  