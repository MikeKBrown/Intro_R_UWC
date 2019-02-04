# Day2_Plotting in R using ggplot2
# Michael Brown
# 30 January 2019

#loading Libraries

library(tidyverse)
library(ggplot2)

chicks <- datasets::ChickWeight
??ChickWeight

ggplot(data = chicks, aes(x = Time, y = weight)) +
  geom_point() +
  geom_line(aes(group = Chick))

ggplot(chicks, aes( x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick))

ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point(colour = "blue") + 
  geom_line(aes(group = Chick))

ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) +
  geom_smooth(method = "lm") +
  labs(x = "Days", y = "Weight (Kg)") +
  ggtitle("Chick Diets") +
  theme_bw()

# Comparing blade length and total length
ggplot(lam, aes(x = total_length, y = blade_length, colour = site)) +
  geom_point() +
  geom_line(aes(group = Ind))

# Thought this would look better with a line of best fit.
ggplot(lam, aes(x = total_length, y = blade_length, colour = site)) +
  geom_point() +
  geom_smooth(method = "lm")

# Facetting in ggplot
library(ggpubr)

ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~Diet, ncol = 1, nrow = 4)

chicks_2 <- chicks %>% 
  filter(Time == 21)

plot_1 <- ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick)) +
labs(x = "days", y = "Weight (kg)") +
ggtitle("Chick Weights")
plot_1

plot_2 <- ggplot(chicks, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "days", y = "Weight (kg)") +
  ggtitle("Chick Weights 2")
plot_2

plot_3 <- ggplot(chicks_2, aes(x = weight)) +
  geom_histogram(aes(fill = Diet), position = "dodge", binwidth = 100) +
  labs(x = "Final_Mass (g)", y = "Count")
plot_3

plot_4 <- ggplot(chicks_2, aes(x = Diet, y = weight)) +
  geom_boxplot(aes(fill = Diet)) +
  labs(x = "Diet", y = "Final Mass (g)")
plot_4

plot_combined <- ggarrange(plot_1, plot_2, plot_3, plot_4)

## 3rd Library
library(boot)

urine <- boot::urine

??urine

urine %>% 
  select(-cond) #removes the conductivity column 

ggplot(data = urine, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = cond))

ggplot(data = urine, aes(x = osmo, y = ph)) +
  geom_point(aes(colour = as.factor(r)))

# Script runs
# Lack of comments throughout the script
# Trying different/new things will be an advantage