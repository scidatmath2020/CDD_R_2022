library(tidyverse)
library(nycflights13)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

ggplot() +
  geom_point(data=weather,
             mapping = aes(x=temp),
             y=0,
             size=2,
             alpha = 0.1) +
  ylim(c(-0.25,0.25)) +
  scale_x_continuous(breaks=seq(0,100,10))


ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp))


ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp),
                 color = "white",
                 fill = "steelblue")


ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp),
                 color = "white",
                 fill = "steelblue",
                 bins = 16) +
  scale_x_continuous()

ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp),
                 color = "white",
                 fill = "steelblue",
                 binwidth = 10)

####################################################

ggplot() +
  geom_histogram(data = weather,
                 mapping = aes(x=temp,y=..count../sum(..count..)),
                 color = "white",
                 bins = 20) +
  scale_y_continuous(labels = scales::percent)

max(weather$temp,na.rm=TRUE)
min(weather$temp,na.rm=TRUE)

mi_data = data.frame("col1"=c("A","B","C","A","A","B","C"),
                     "col2"=c(1:7))


ggplot() + 
  geom_histogram(data = weather,
                 mapping = aes(x=temp,y=..density..),
                 color = "white",
                 bins = 10) +
  geom_density(data = weather,
                 mapping = aes(x=temp),
                 color = "black",
               fill = "yellow",
               alpha = 0.5
                 )


ggplot() + 
  geom_density(data = weather,
               mapping = aes(x=temp),
               color = "black",
               fill = "yellow",
               alpha = 0.5
  ) +
  geom_vline(xintercept = 25) +
  geom_vline(xintercept = 40)


clima_medio = weather[weather$temp > 25 & weather$temp < 40,]
  
ggplot() +
  geom_histogram(data = clima_medio,
                 mapping = aes(x=temp,y=..count../sum(..count..)),
                 color = "white",
                 bins = 20) +
  scale_y_continuous(labels = scales::percent)

######################################

sismos = read.csv("sismos.csv")


ggplot() +
  geom_density(data = sismos,
               mapping = aes(x=Magnitud),
               fill = "yellow")


ggplot() +
  geom_density(data = sismos,
               mapping = aes(x=Magnitud,fill=entidad),
               alpha=0.5)

mis_entidades = c("OAX","BC","CHIS","GRO")

sismos_entidades = sismos %>% filter(entidad %in% mis_entidades)

ggplot() +
  geom_density(data = sismos_entidades,
               mapping = aes(x=Magnitud,fill=entidad),
               alpha=0.5)

##############################################

mis_entidades = c("ZAC","OAX","AGS","BC")

sismos_entidades = sismos %>% filter(entidad %in% mis_entidades)

ggplot() +
  geom_histogram(data = sismos_entidades,
               mapping = aes(x=Magnitud,y=..density..,fill=entidad),
               alpha=0.5) +
  geom_density(data = sismos_entidades,
               mapping = aes(x=Magnitud,fill=entidad),
               alpha=0.5)




