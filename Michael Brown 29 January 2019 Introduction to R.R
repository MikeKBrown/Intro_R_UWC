# Day 1
# Simple stats
# Mike
# 29/01/2019



a + b # Adding a to b
mass <- 48
mass <- mass * 2.0
age <- 126
age <- age - 17
mass_index <- mass/age
x <- 40
y <- 23
z <- x-y
z
# DAY_1_R
# Calculate a monthly climatology per site
# Author: M Brown (Following AJ Smit)
# DATE: 29/01/2019

library(tidyverse)
library(lubridate)

temp <- read.csv("data/SACTN_data.csv")

temp2 <- temp %>% 
  dplyr::mutate(month = month(date)) %>% 
  dplyr::group_by(site, month) %>% 
  dplyr::summarise(temp = mean(temp, na.rm = TRUE)) %>% 
  ungroup()
library(devtools)
devtools::install_github("hadley/tidyverse")

  library(tidyr)
  
  
# Script runs
# Adding comments throughout the script may help for future reference
