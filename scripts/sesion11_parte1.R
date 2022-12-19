library(tidyverse)
library(nycflights13)


resumen_mensual_temperaturas <- weather %>% 
  group_by(month) %>% 
  summarize(mean = mean(temp, na.rm = TRUE), 
            std_dev = sd(temp, na.rm = TRUE))

resumen_mensual_temperaturas

######################################################

diamonds

diamonds %>% 
  group_by(cut)

?diamonds

diamonds %>%
  group_by(cut)

diamonds %>% 
  group_by(cut) %>% 
  summarize(avg_price = mean(price))

diamonds %>% 
  group_by(carat) %>% 
  summarize(avg_price = mean(price))

diamonds %>% 
  group_by(carat) %>%
  summarize(precio_promedio = mean(price,na.rm=TRUE))


ggplot()+
  geom_point(data = diamonds,
             mapping = aes(x=carat,y=price,color=cut))


####################################################

flights %>% 
  group_by(origin) %>%
  summarize(total_de_vuelos = n())

flights %>%
  group_by(origin,month) %>%
  summarize(total = n()) %>%
  View()


flights %>% 
  group_by(origin) %>% 
  group_by(month) %>% 
  summarize(count = n())

flights %>%
  group_by(origin,month) %>%
  summarize(total = n()) %>%
  ungroup() %>%
  summarize(media = mean(total))


