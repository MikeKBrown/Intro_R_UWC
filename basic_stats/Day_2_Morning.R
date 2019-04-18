#Day 2
#Morning
#15/04/2019
#Aj Teaching
#Michael Brown

library(tidyverse)
library(ggsn)
library(ggplot2)
library(fitdistrplus)

install.packages("fitdistrplus", repos="http://R-Forge.R-project.org")
#Start
y <- c(18,9,31,7,47,28,20,300,19,6,19,21,99,85,52,68,69,3,48,116,15,27,51,100,105,99,73,58,1,89,222,56,27,36,300,121,5,42,184,88,24,127,67,93,85,60,92,23,39,140,60,71,333,42,16,51,151,625,624,200,350,4,105,199,88,742)

length(y)

mean(y)
sd(y)
median(y)
summary(y)

hist(y)

boxplot(y)

par(mfrow = c(2, 2))
plot(x = c(1:length(y)), y = y)
hist(y)
descdist(y, discrete = FALSE, boot = 100)

# Random normal data
set.seed(666)
r_dat <- data.frame(dat = c(rnorm(n = 1000, mean = 10, sd = 3),
                            rnorm(n = 1000, mean = 8, sd = 2)),
                    sample = c(rep("A", 1000), rep("B", 1000)))

# Create histogram
h <- ggplot(data = r_dat, aes(x = dat, fill = sample)) +
  geom_histogram(position = "dodge", binwidth = 1, alpha = 0.8) +
  geom_density(aes(y = 1*..count.., fill = sample), colour = NA, alpha = 0.4) +
  labs(x = "value")
h

shapiro.test(r_dat$dat)

r_dat %>% 
  group_by(sample) %>% 
  summarise(norm_dat = as.numeric(shapiro.test(dat)[2]))

r_one <- data.frame(dat = rnorm(n = 20, mean = 20, sd = 5), sample = "A")

shapiro.test(r_one$dat)

t.test(r_one$dat, mu = 20)

set.seed(18)
r_two <- data.frame(dat = c(rnorm( n = 20, mean = 6, sd = 1),
                            rnorm( n = 20, mean = 5, sd = 1),
                            sample = c(rep("A", 20), rep("B", 20))))
t.test(dat ~ sample, data = r_two, var.equal = TRUE)
