#16/04/2019
#Morning
#Day_3
#Michael Brown

#Load Libraries
library(tidyverse)
library(ggplot2)
library(fitdistrplus)
library(logspline)
library(praise)
library(ggpubr)
#BEGIN

ecklonia <- read_csv("basic_stats/ecklonia.csv")

eruption.lm <- lm(eruptions ~ waiting, data = faithful)

summary(eruption.lm)

ggplot(faithful, aes(x = waiting, y = eruptions)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Waiting Time (min)", y = "Eruption Time (min)", subtitle = "Linear Regression") +
  theme_classic() +
  ggtitle("Relationship between waiting time and eruption time of the old faithful geyser.") +
  annotate("text", label = "Slope: 0.075628 +/- 0.002219 (min/min)", x = 50, y = 5) +
annotate("text", label = "P = 2e-16", x = 50, y = 4.75) +
  annotate("text", label = "R squared 0.8115", x = 50, y = 4.5)

#Correlations

cor.test(x = ecklonia$stipe_length, ecklonia$frond_length,
         use = "everything", method = "pearson")

ecklonia_sub <- ecklonia %>% 
  select(-species, -site, -ID)

ecklonia$length <- as.numeric(cut((ecklonia$stipe_length+ecklonia$frond_length), breaks = 3))

cor.test(ecklonia$length, ecklonia$digits)

ecklonia_norm <- ecklonia_sub %>% 
  gather(key = "variable") %>% 
  group_by(variable) %>% 
  summarise(variable_norm = as.numeric(shapiro.test(value)[2]))
ecklonia_norm

cor.test(ecklonia$primary_blade_length, ecklonia$primary_blade_width, method = "kendall")

# Calculate Pearson r beforehand for plotting
r_print <- paste0("r = ", 
                  round(cor(x = ecklonia$stipe_length, ecklonia$frond_length),2))

# Then create a single panel showing one correlation
ggplot(data = ecklonia, aes(x = stipe_length, y = frond_length)) +
  geom_smooth(method = "lm", colour = "grey90", se = F) +
  geom_point(colour = "mediumorchid4") +
  geom_label(x = 300, y = 240, label = r_print) +
  labs(x = "Stipe length (cm)", y = "Frond length (cm)") +
  theme_pubclean()

corrplot(ecklonia_pearson, method = "circle")
