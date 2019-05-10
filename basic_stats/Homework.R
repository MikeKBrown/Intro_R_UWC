#Homework Exercises
#18/04/2019
#Michael Brown

#load packages

library(tidyverse)
library(fitdistrplus)
library(ggplot2)
library(ggpubr)
library(corrplot)
library(reshape2)

#t.test
#Exercise 1
#create dataset

set.seed(18)
Normdata_1 <- data.frame(dat = rnorm(n = 200, mean =48, sd = 3))

#Hypothesis
#Is the average age of people who frequent the gym less than 60 years old?

#H0: the average age of people who frequent the gym is not less than 60.

#data work

shapiro.test(Normdata_1$dat)

t.test(Normdata_1$dat, mu = 60, alternative = "less")

#Answer
#The average age of gym goers is not less than 60. (p = 2.2e-16, t = -57.477, df = 199)

#Exercise 2

#Create Dataset

dogs <- matrix(c(2, 4, 8, 6), ncol = 2)
colnames(dogs) <- c("Yes", "No")
rownames(dogs) <- c("Mary", "John")

#Hypothesis
#John is more likely to see dogs than Mary on his way to school.
#H0 there is no difference in the likelihood of seeing dogs on the way to school between John and Mary.

#Data Handling
prop.test(dogs)

#Answer
#John is not more likely to see dogs on his way to school. (p = 0.62556, df = 1, prop 1 = 0.2, prop 2 = 0.4)

#ANOVA

#Exercise 1

#Data

feed_1 <- c(60.8, 57.0, 65.0, 58.6, 61.7)
feed_2 <- c(68.7, 67.7, 74.0, 66.3, 69.8)
feed_3 <- c(102.6, 102.1, 100.2, 96.5)
feed_4 <- c(87.9, 84.2, 83.1, 85.7, 90.3)

#dataframe
bacon <- as.tibble(data.frame(
  feed = c(
    rep("Feed 1", length(feed_1)),
    rep("Feed 2", length(feed_2)),
    rep("Feed 3", length(feed_3)),
    rep("Feed 4", length(feed_4))
  ),
  mass = c(feed_1, feed_2, feed_3, feed_4)
))

#Hypothesis
#Feed type will have a difference on the end mass of the pigs
#H0 there is no difference in end mass of pigs who consume different feed types

#Data Handling
bacon.aov1 <- aov(mass~feed, data = bacon)
summary(bacon.aov1)

#Answer
#Feed type does have an effect on the mass of pigs (p = 1.06e-11, df = 3, F = 164.6)

#Exercise 2

#data
teeth <- datasets::ToothGrowth

#Hypothesis
#Different types and levels of vitamin C will lead to different rates of tooth growth
#H0: Different types and levels vitamin C will not lead to different rates of tooth growth

tooth.aov <- aov(len~dose + supp, data = teeth)
summary(tooth.aov)

#Answer
#There is a difference in tooth length as a result of different doses of vitamin C (p = 1.23e-14, df = 1, F = 123)
#There is a difference in tooth length as a result of different types of vitamin C ingestion (p = 0.0013, df = 1, F = 11.45)

#Exercise 3
#dataset
crab <- crabs

#Hypothesis
#Body depth and carapace length have an effect on frontal lobe size
#H0 body depth and carapace length have no effect on frontal lobe size

#data handling
crab.aov <- aov(FL~BD + CL, data = crab)
summary(crab.aov)

#answer
#Body depth has an effect on frontal lobe size (p = 2e-16, df= 1, F = 8440.94)
#Carapace length has an effect on frontal lobe size (p = 9.79e-05, df = 1, F = 15.82)

ggplot(data = crabs, aes(x = BD, y = CL)) +
  geom_point(aes(size = FL)) +
  theme_bw() +
  labs(title = "Relationship of Body Depth, Carapace Length and Frontal lobe size", x = "Body Depth (mm)", 
       y = "Carapace Length (mm)")

#Correlations
#Excercise 1
#Continuation of work from Tuesday

#Load Data
ecklonia <- read_csv("data/ecklonia.csv")

ecklonia_sub <-ecklonia %>% 
dplyr::select(-species, - site, - ID)
ecklonia_pearson <- cor(ecklonia_sub)
meltedpears <- melt(ecklonia_pearson)

ggplot(meltedpears, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_distiller(palette = "Reds") +
  theme(axis.text.x=element_text(angle = 90, vjust = 0.625)) +
  labs(title = "Heatmap")
*  
 
 # Answers and correctly interpr all the questions
  # More comments would only improve your understanding and show the marker what you are doing at each of the lines of code
# Nicely done
