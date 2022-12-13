library(ggplot2)
library(nycflights13)

clima_noviembre = weather %>% filter(month == 11)

summary(clima_noviembre$temp)

########################################

ggplot() +
  geom_boxplot(data = weather,
               mapping = aes(y=temp))

summary(weather$temp)

#######################################

ggplot() +
  geom_boxplot(data = weather,
               mapping = aes(x=factor(month),y=temp,fill=factor(month))) 


IQR(clima_mayo$temp)
summary(clima_mayo$temp)

barrera1 = 55.04-1.5*IQR(clima_mayo$temp)
barrera2 = 66.92+1.5*IQR(clima_mayo$temp)

clima_mayo %>% filter(temp>barrera2)
clima_mayo %>% filter(temp<barrera1)

#################################################

ggplot() +
  geom_boxplot(data = weather,
               mapping = aes(x=factor(month),y=temp,fill=factor(month))) +
  coord_flip()

#################################################

ggplot() +
  geom_boxplot(data = weather,
               mapping = aes(x=factor(month),y=temp,fill=origin))


#################################################

sismos = read.csv("sismos.csv")

names(sismos)





names(weather)