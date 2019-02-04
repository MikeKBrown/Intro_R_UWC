insect <- datasets::InsectSprays

avrg <- insect %>% 
group_by(spray) %>% 
  summarise(avrg_count = mean(count))

insect %>% 
select(spray)

ggplot(avrg, aes(x = spray, y = avrg_count, fill = spray)) +
  geom_col() +
  coord_polar(theta = "y") +
  labs(x = "Spray", y = "Average Count" ) +
  ggtitle("Experimental pie chart thing showing average counts of each spray")

attitude <- datasets::attitude

??attitude

comp <- attitude %>%   
group_by(rating) %>% 
  summarise(max_comp = max(complaints))

attitude %>% 
  select(-raises,-privileges)

ggplot(attitude, aes (x =privileges, y = advance, group = rating)) +
  geom_point(aes(size = rating)) +
  labs(x = "Privileges", y = "Advance") +
  ggtitle("The difference in privileges and advances and the effect on rating")

    
  