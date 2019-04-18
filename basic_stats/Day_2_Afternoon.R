#day 2
#Afternoon
#michael


chicks <- as_tibble(ChickWeight)

chicks_sub <- chicks %>% 
  filter(Diet %in% c(1, 2), Time == 21)

t.test(weight ~ Diet, data = chicks_sub, var.equal = TRUE)

t.test(weight ~ Diet, data = chicks_sub)

chicks.aov1 <- aov(weight~ Diet, data = filter(chicks, Time == 21))
summary(chicks.aov1)

#null: there is no difference between the effect of different diets on mass gain of a chick
#hypothesis: there is a difference between the effects of different diets on the mass gain of the chicks

ggplot(data = filter(chicks, Time ==21), aes(x = Diet, y = weight)) +
  geom_boxplot(notch = TRUE, aes(fill = Diet))

TukeyHSD(chicks.aov1, ordered = TRUE)

plot(TukeyHSD(aov(weight ~ Diet, data = filter(chicks, Time %in% c(0)))))

summary(aov(weight ~ Diet + as.factor(Time), data = filter(chicks, Time %in% c(0, 21))))
