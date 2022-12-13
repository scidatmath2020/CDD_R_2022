library(tidyverse)
library(nycflights13)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

ggplot() +
  geom_histogram(data =weather,
                 mapping = aes(x=temp, fill=factor(month)),
                 color = "white",
                 alpha = 0.5) +
  facet_wrap(~ month)

ggplot() +
  geom_histogram(data =weather,
                 mapping = aes(x=temp,fill=origin),
                 color = "white",
                 alpha = 0.5) +
  facet_wrap(~origin)

######################################################

Mexico = read.csv("Mexico_division_politica.csv")

names(Mexico)

ggplot() +
  geom_polygon(data = Mexico,
               mapping = aes(x=Longitud,y=Latitud,group=Grupo),
               fill = "steelblue",
               color = "black") +
  coord_map() +
  facet_wrap(~Grupo)

########################################

ggplot() +
  geom_histogram(data =weather,
                 mapping = aes(x=temp, fill=factor(month)),
                 color = "white",
                 alpha = 0.5) +
  facet_wrap(~ month,nrow = 3)

# Si la columna para las facetas tiene n valores diferentes,
# conviene colocar como nrow o ncol algún divisor de n. Por ejemplo
# si n=12, entonces toma nrow = 1, 2, 3, 4, 6, 12

##########################################

clima_estaciones = weather %>% filter(month %in% c(6,7,8,11,12,1))

ggplot() +
  geom_histogram(data = clima_estaciones,
                 mapping = aes(x=temp, fill=factor(month)),
                 color = "white",
                 alpha = 0.5) +
  facet_wrap(~ month)

#############################################

weather$calor = ifelse(weather$temp<=68,"frio","calor")

ggplot() +
  geom_histogram(data =weather,
                 mapping = aes(x=temp, fill=calor),
                 color = "white",
                 binwidth = 1) +
  facet_wrap(~ month,nrow = 3)








colors()



names(weather)