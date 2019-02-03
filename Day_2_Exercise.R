# Day 2 Exercise 1
# Michael Brown
# 30 January 2019

# Choose 3 datasets, generate 2 graphs for each dataset. 
# Calculate the mean of one column from each dataset.

#Laminaria Dataset: 3 graphs

cars <- datasets::cars
beaver <- datasets::beaver1
plant <- datasets::PlantGrowth
air <- datasets::airquality

# what time of day are beavers most active?

beaver_plot_1 <- ggplot(beaver, aes(x = time, y = activ)) +
  geom_point() +
  labs(x = "Time", y = "Activity") +
  ggtitle("Beaver activity")
beaver_plot_1

# Does temperature affect beaver activity levels?
beaver_plot_2 <- ggplot(beaver, aes(x = temp, y = activ)) +
  geom_point() +
  labs(x = "temp", y = "Activity") +
  ggtitle("beaver activity with regards to temperature")
beaver_plot_2

# What is the relationship between car stopping distance and speed?

car_plot_1 <- ggplot(cars, aes(x = speed, y = dist)) +
  geom_point() +
  geom_line () +
  labs(x = "Speed", y = "Distance") +
  ggtitle("car stopping distance at different speeds")
car_plot_1

#Mean stopping distance
cars %>% 
  summarise(avrg_dst = mean(dist))

# Which Treatment condition yielded the best plant growth?

plant_plot_1 <- ggplot(plant, aes(x = group, y = weight)) +
  geom_bar(stat = "identity") +
  labs(x = "Group", y = "Weight") +
  ggtitle("plant weight according to treatment type")
plant_plot_1

#Mean Plant Weight

plant %>% 
  summarise(avrg_weight = mean(weight))

#How does solar radiation affect daily temperatures?

air_plot_1 <- ggplot(air, aes(x = Solar.R, y = Temp)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Solar Radiation", y = "Temperature") +
  ggtitle("solar radiation and its effect on air temperature")
air_plot_1

# Do daily temperatures affect wind speeds?

air_plot_2 <- ggplot(air, aes(x = Temp)) +
  geom_histogram(aes(fill = Wind), position = "dodge") +
  labs(x = "temperature", y = "Wind") +
  ggtitle("temperature and its effect on wind")
air_plot_2

# Mean Wind Speed

air %>% 
  summarise(avrg_ws = mean(Wind))

# Laminaria plots

#Does an increase in blade length directly relate to an increase in blade weight?

lam_plot_1 <- ggplot(lam, aes(x = blade_length, y = blade_weight, colour = site))+
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Blade Length", y = "Blade Weight") +
  ggtitle("Blade length vs blade weight")
lam_plot_1

#Effect of stipe diameter on stipe mass

lam_plot_2 <- ggplot(lam, aes(x = stipe_diameter, y = stipe_mass)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Stipe diameter", y = "stipe mass") +
  ggtitle("effect of stipe diameter on stipe mass")
lam_plot_2

lam_plot_3 <- ggplot(lam, aes(x = total_length, y = thallus_mass)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Total Length", y = "Thallus Mass") +
  ggtitle("Effect of total length on Thallus Mass")
lam_plot_3

# Good plants
# Lack of comments throughout the script
# Always good practice to answer the hypothesis after creating a visualisation
