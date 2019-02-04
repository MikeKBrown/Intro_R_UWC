#Exercise_2
#Michael Brown
#04/02/2019

#read in csv
ecklonia <- read.csv("data/ecklonia.csv")
head(ecklonia, n = 5)
tail(ecklonia, n = 5)
glimpse(ecklonia)

#Dimensions
dim(ecklonia)

#How do the stipe lengths differ amongst samples?
plot_1 <- ggplot(ecklonia, aes(x = ID, y = stipe_length, position = "dodge", width = NULL, na.rm = FALSE, show.legend = NA, inherit.aes = TRUE)) +
  geom_col() +
  labs(x = "ID", y = "Stipe Length") +
  ggtitle("Differences in Kelp Stipe Length")

# Is there a relationship between stipe length and stipe diameter?

plot_2 <- ggplot(ecklonia, aes(x = stipe_length, y = stipe_diameter)) +
  geom_line() +
  labs(x = "Stipe Length", y = "Stipe Diameter")+
  ggtitle("relationshipe of stipe length and diameter")

# Is there a relationship between blade width and blade length?
plot_3 <- ggplot(ecklonia, aes(x = primary_blade_width, y = primary_blade_length)) +
  geom_boxplot(aes(fill = primary_blade_width, group = ID)) +
  labs(x = "Blade width", y = "Blade Length") +
  ggtitle("Relationship between blade length and blade width")

#ggarrange
ggarrange(plot_1, plot_2, plot_3)

#statistical analysis

#mean 

ecklonia %>% 
   group_by(site) %>% 
  summarise(avrg_sl = mean(stipe_length))
 
 ecklonia %>% 
 summarise(avrg_sd = mean(stipe_diameter))
 
 #maximum
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(max_sl = max(stipe_length))

 ecklonia %>% 
   group_by(site) %>% 
   summarise(max_sd = max(stipe_diameter))
 
 #minimum
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(min_sl = min(stipe_length))
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(min_sd = min(stipe_diameter))
 
 #median
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(med_sl = median(stipe_length))
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(med_sd = median(stipe_diameter))
 
 #variance
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(var_sl = var(stipe_length))
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(var_sd = var(stipe_diameter))
 
 #standard Error
 
 ecklonia %>% 
   group_by(site) %>% 
   summarise(var_sl = var(stipe_length), 
             n_sl = n()) %>%  
   mutate(se_sl = sqrt(var_sl / n_sl)) 

 ecklonia %>% 
   group_by(site) %>% 
   summarise(var_sd = var(stipe_diameter), 
             n_sd = n()) %>%  
   mutate(se_sd = sqrt(var_sd / n_sd)) 

 #frond length
 ecklonia %>% 
   summarise(min_fl = min(frond_length))

 ecklonia %>% 
   summarise(max_fl = max(frond_length))

 #stipe length
 ecklonia %>% 
   summarise(min_sl = min(stipe_length))
 
 ecklonia %>% 
   summarise(max_sl = max(stipe_length))

 ecklonia %>% 
   summary()

