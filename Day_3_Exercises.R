laminaria <- read_csv("data/laminaria.csv")
save(laminaria, file = "data/laminaria.RData")

#ggsn adds north arrows and scale bars in kilometers to maps that are generated using ggplot2 or ggmap.
# Scales graphically adds scale map data to map aesthetics
#Scales also provides methods for determining automatic breaks and axis lables and legends