library(tidyverse)
library(nycflights13)

flights %>% group_by(dest) %>%
  summarize(total_de_vuelos = n()) %>%
  arrange(total_de_vuelos)


flights %>% group_by(dest) %>%
  summarize(total_de_vuelos = n()) %>%
  arrange(-total_de_vuelos)

###################################################

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")
sismos = read.csv("sismos.csv")

names(sismos)

### Si la variable para ordenar es de texto, para hacer el 
### orden descendente utilizamos desc() dentro del arrange
sismos %>%
  filter(Magnitud >= 7) %>%
  arrange(desc(entidad)) %>% View()

sismos %>%
  filter(Magnitud >= 7) %>%
  arrange(desc(entidad),Magnitud) %>% View()

sismos %>%
  filter(Magnitud >= 7) %>%
  arrange(entidad,-Magnitud) %>% View()

