library(tidyverse)
library(nycflights13)

### Tabla de vuelos que llegaron a Portland. El código de Portland es PDX

names(flights)

vuelos_portland = flights %>%
  filter(dest == "PDX")

# Con R puro sería de esta manera flights[flights$dest == "PDX",]

vuelos_filtrados = flights %>%
  filter((origin == "JFK") & (dest=="BTV" | dest=="SEA") & (month >=10))


vuelos_filtrados = flights %>%
  filter(origin == "JFK", dest=="BTV" | dest=="SEA",month >=10)

vuelos_filtrados = flights %>%
  filter(origin == "JFK", dest %in% c("BTV","SEA"),month >=10)


##### Vuelos que no salieron hacia BTV ni hacia SEA

flights %>%
  filter(!(dest %in% c("BTV","SEA"))) 


#####

vuelos_sin_oct = flights %>% 
  filter(month != 10)


flights = flights %>% 
  filter(month != 10)

# Para eliminar la tabla vuelos_filtrados
rm(list = c("vuelos_filtrados"))

# Para eliminar todos los objetos dentro de R
rm(list = ls())

#########################################
flights %>% 
  filter(dest == "BTV" | dest == "SEA" | dest == "PDX")

flights %>% 
  filter(dest %in% c("BTV","SEA","PDX"))

flights %>% 
  filter(month %in% c(1,11,12))

flights %>% 
  filter(month %in% 6:11)

flights %>% 
  filter(month > 6, month<=8)


6:8