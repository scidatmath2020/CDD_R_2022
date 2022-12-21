setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\mapa_vuelos_nyc")}

library(tidyverse)
library(nycflights13)

aeropuertos = read.csv("aeropuertos.csv")
load("fifty_states.rda")

###############################################

flights %>% names()
aeropuertos %>% names()

vuelos_estado = flights %>%
  left_join(aeropuertos[,c("faa","lat","lon","state")],
            by = c("dest"="faa"))

total_por_estado = vuelos_estado %>%
  group_by(state) %>%
  summarize(total = n())


fifty_states %>% names()

fifty_states %>% distinct(id)

mapa = fifty_states %>%
  left_join(total_por_estado,
            by = c("id"="state"))


vuelos_internos = vuelos_estado %>% 
  filter(!(state %in% c("alaska","hawaii")))

vuelos_internos %>% names()


nrow(vuelos_internos)


ggplot() +
  geom_polygon(data = mapa,
               mapping = aes(x=long,y=lat,group=group,fill=total)) +
  geom_point(data = vuelos_internos,
             mapping = aes(x=lon,y=lat),
             color="black") +
  geom_point(data = vuelos_internos,
             mapping = aes(x=lon,y=lat,color = origin),
             ) +
  coord_map()

vuelos_internos %>% names()

fifty_states$group[1:10]

