library(tidyverse)
library(nycflights13)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

names(weather)

ggplot() +
  geom_density(data=weather,
               mapping = aes(x=temp),
               fill = "yellow",
               colour = "black")


resumen_temp = weather %>%
  summarize(media = mean(temp,na.rm=FALSE),
            desviacion = sd(temp,na.rm = TRUE)) 

resumen_temp = weather %>%
  summarise(media = mean(temp,na.rm=TRUE),
            desviacion = sd(temp,na.rm = TRUE)) 

weather %>%
  filter(!(temp %in% c(NA))) %>%  #!=
  summarize(media = mean(temp))


weather %>%
  filter(origin == "JFK") %>%  
  summarize(media = mean(temp), maximo = max(temp))

weather %>%
  filter(temp %in% c(NA))

weather %>%
  filter(temp %in% c(NA)) %>%
  summarize(total = n())


weather %>%
  summarize(total = n())

nrow(weather)


##############################################################


weather %>%
  filter(origin == "JFK") %>%
  summarize(temp_minima = min(temp,na.rm=TRUE),
            temp_maximo = max(temp,na.rm=TRUE))


weather %>%
  filter(origin == "EWR") %>%
  summarize(temp_minima = min(temp,na.rm=TRUE),
            temp_maximo = max(temp,na.rm=TRUE))


weather %>%
  filter(origin == "LGA") %>%
  summarize(temp_minima = min(temp,na.rm=TRUE),
            temp_maximo = max(temp,na.rm=TRUE))

unique(weather$origin)

mi_funcion = function(columna){
  return(sum(log(columna)))
}


weather %>%
  filter(origin == "LGA") %>%
  summarize(temp_minima = min(temp,na.rm=TRUE),
            temp_maximo = max(temp,na.rm=TRUE),
            suma_logaritmos = mi_funcion(temp))

weather %>%
  filter(origin == "LGA") %>%
  summarize(temp_minima = min(temp,na.rm=TRUE),
            temp_maximo = max(temp,na.rm=TRUE),
            dif_temp = temp_maximo-temp_minima,
            suma_logaritmos = mi_funcion(temp))








