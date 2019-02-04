# Weekend Homework
#04/02/2019
#Michael Brown

#Exercise 1

#Load Libraries

library(tidyverse)
library(ggpubr)
library(ggsn)

# Load datasets
load("data/rast_aug.RData")
load("data/rast_feb.RData")
load("data/sa_provinces.RData")

#Exploring rast_aug

head(rast_aug, n = 5)
tail(rast_aug, n = 5)
glimpse(rast_aug)
dim(rast_aug)

#exploring rast_feb

head(rast_feb, n = 5)
tail(rast_feb, n = 5)
glimpse(rast_feb)
dim(rast_feb)

#Creating a map

ggplot(data = sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group))

# Adding a colour pallette

ggplot(sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group)) + 
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  geom_raster(data = rast_aug, aes(fill = bins)) +
  scale_fill_manual("Temp. (°C)", values = c("#5CEFE1", "#52CFCE", "#4CAFB9", "#4890A0", "#437386", "#3B576A", "#335262", "24313E"))

#Adding Lables

ggplot(sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group)) + 
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  geom_raster(data = rast_aug, aes(fill = bins)) +
  scale_fill_manual("Temp. (°C)", values = c("#5CEFE1", "#52CFCE", "#4CAFB9", "#4890A0", "#437386", "#3B576A", "#335262", "24313E")) +
  labs(x = "Longitude", y = "Latitude") +
  ggtitle("South African Sea Temperatures")

#Adding ocean lables and increasing text size

ggplot(sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group)) + 
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  geom_raster(data = rast_aug, aes(fill = bins)) +
  scale_fill_manual("Temp. (°C)", values = c("#5CEFE1", "#52CFCE", "#4CAFB9", "#4890A0", "#437386", "#3B576A", "#335262", "24313E")) +
  labs(x = "Longitude", y = "Latitude") +
  ggtitle("South African Sea Temperatures") +
  annotate("text", label = "Atlantic\nOcean", x = 16.5, y = -34.5, size = 6.0, angle = 30, colour = "#5CEFE1") +
  annotate("text", label = "Indian\nOcean", x = 29.2, y = -34.2, size = 6.0, angle = 330, colour = "#335262")

#Include North Arrows

ggplot(sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group)) + 
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  geom_raster(data = rast_aug, aes(fill = bins)) +
  scale_fill_manual("Temp. (°C)", values = c("#5CEFE1", "#52CFCE", "#4CAFB9", "#4890A0", "#437386", "#3B576A", "#335262", "24313E")) +
  labs(x = "Longitude", y = "Latitude") +
  ggtitle("South African Sea Temperatures August") +
  annotate("text", label = "Atlantic\nOcean", x = 16.5, y = -34.5, size = 6.0, angle = 30, colour = "#5CEFE1") +
  annotate("text", label = "Indian\nOcean", x = 31.2, y = -32.2, size = 6.0, angle = 330, colour = "#335262") +
  scalebar(x.min = 27, x.max = 32, y.min = -35, y.max = -34, dist = 200, height = 1, st.dist = 0.8, st.size = 4, dd2km = TRUE, model = "WGS84") +
  north(x.min = 17.5, x.max = 20.5, y.min = -28, y.max = -26, scale = 1.2, symbol = 15)

#Create map for insetting

map_1 <- ggplot(sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group)) + 
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  geom_raster(data = rast_feb, aes(fill = bins)) +
  scale_fill_manual("Temp. (°C)", values = c("#5CEFE1", "#52CFCE", "#4CAFB9", "#4890A0", "#437386", "#3B576A", "#335262", "#24313E")) +
  labs(x = "Longitude", y = "Latitude") +
  ggtitle("South African Sea Temperatures February") +
  annotate("text", label = "Atlantic\nOcean", x = 16.5, y = -34.5, size = 6.0, angle = 30, colour = "#5CEFE1") +
  annotate("text", label = "Indian\nOcean", x = 31.2, y = -32.2, size = 6.0, angle = 330, colour = "#335262")

map_1

#Insetting
ggplot(sa_provinces, aes(x = lon, y = lat)) +
  geom_path(aes(group = group)) + 
  coord_equal(xlim = c(15, 34), ylim = c(-36, -26), expand = 0) +
  geom_raster(data = rast_aug, aes(fill = bins)) +
  scale_fill_manual("Temp. (°C)", values = c("#5CEFE1", "#52CFCE", "#4CAFB9", "#4890A0", "#437386", "#3B576A", "#335262", "24313E")) +
  labs(x = "Longitude", y = "Latitude") +
  ggtitle("South African Sea Temperatures August") +
  annotate("text", label = "Atlantic\nOcean", x = 16.5, y = -34.5, size = 6.0, angle = 30, colour = "#5CEFE1") +
  annotate("text", label = "Indian\nOcean", x = 31.2, y = -32.2, size = 6.0, angle = 330, colour = "#335262") +
  scalebar(x.min = 27, x.max = 32, y.min = -35, y.max = -34, dist = 200, height = 1, st.dist = 0.8, st.size = 4, dd2km = TRUE, model = "WGS84") +
  north(x.min = 17.5, x.max = 20.5, y.min = -28, y.max = -26, scale = 1.2, symbol = 15) +
  annotation_custom(grob = ggplotGrob(map_1),xmin = 18.5, xmax = 27.5, ymin = -33.5, ymax = -28.5)

  



