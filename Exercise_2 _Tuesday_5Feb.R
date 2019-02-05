# Michael Brown
#Exercise 2
#05/02/2019
#Copying Prof Smit's graphs

#Part 1
#Load Libraries
library(tidyverse)
library(lubridate)
library(ggpubr)

#Load Data

load("data/SACTNmonthly_v4.0.RData")

SACTN <- SACTNmonthly_v4.0

SACTN_1 <- SACTN %>% 
  filter(src == "KZNSB") %>% 
  separate(col = date, into = c("year", "month", "day")) %>%
  group_by(site, year) %>% 
  summarise(avrg_temp = mean(temp)) %>% 
  na.omit()

ggplot(SACTN_1, aes(x = as.numeric(year), y = avrg_temp)) +
  geom_line(aes(group = site), colour = "red") +
  facet_wrap(~site, ncol = 5) + 
  labs(x = "Year", y = "Temperature") +
  ggtitle("KZNSB series of annual means") +
  scale_x_continuous(name = "Year", breaks = c(1980, 2000), labels = c("1980", "2000")) +
  scale_y_continuous(name = "Temperature (°C)", breaks = c(20, 22 ,24), labels = c("20", "22", "24"), limits = c(20, 24))
                   

#Part 2
lam <- read_csv("data/laminaria.csv")

lam_FB <- lam %>% 
  filter( region == "FB")

Plot_1 <- ggplot(lam_FB, aes(x = blade_length, y = blade_weight, colour = site)) +
  scale_color_brewer(palette = "Accent") +
  geom_point() +
  geom_line() +
  facet_wrap(~site, ncol = 3) + 
  labs(x = "Blade length (cm)", y = "Blade mass (kg)") +
  ggtitle("A crazy graph of some data for False Bay sites")

#Fix

Plot_2 <- ggplot(lam_FB, aes(x = blade_length, y = blade_weight, colour = site, (colours = c("#48B4B6", "#45A7AD", "#439AA3", "#418E9A", "#3F828F", "#3D7685", "#3A6A7A", "#466E41", "#345363")))) +
  geom_point() +
  geom_line() +
  facet_wrap(~site, ncol = 3) + 
  labs(x = "Blade length (cm)", y = "Blade mass (kg)") +
  ggtitle("A crazy graph of some data for False Bay sites")

ggarrange(Plot_1, Plot_2, ncol = 2, nrow = 1, labels = c("A", "B"),common.legend = TRUE) 

#Part 3

#load data
Tooth <- datasets::ToothGrowth

Tooth_mean <- Tooth %>% 
  group_by(supp, dose) %>% 
  summarise(avrg_len = mean(len))

ggplot(Tooth_mean, aes(x = dose, y = avrg_len, fill = supp)) +
  geom_col(position = "dodge", colour = "black") +
  geom_errorbar(aes(ymin = avrg_len-5, ymax = avrg_len + 5, width = 0.45), position = "dodge") +
  labs(x = "Dose (mg/d)", y = "Tooth Length (mm)")

  