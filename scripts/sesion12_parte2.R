library(tidyverse)
library(nycflights13)

flights %>% names()

airlines %>% names()

flights %>% head() %>% View()

inner_join(flights,airlines) 

###################################################

### inner_join() se queda únicamente con las filas donde encontró
### coincidencia

flights_joined <- flights %>% inner_join(airlines) 

flights_joined %>% select(carrier,name) %>% View()

###################################################

names(flights)

flights$dest[1:10]


flights %>% inner_join(airports,
                       by = c("dest"="faa"))

VUELOS_CON_NOMBRE_DEST = flights %>% inner_join(airports[,c("faa","name")],
                       by = c("dest"="faa"))

write.csv(VUELOS_CON_NOMBRE_DEST,
          "vuelos_con_nombre_dest.csv")

###############################################

named_dests <- flights %>%
  group_by(dest) %>%
  summarize(num_flights = n()) %>%
  arrange(desc(num_flights)) %>%
  inner_join(airports, by = c("dest" = "faa")) %>%
  rename(airport_name = name)

###############################################

weather = weather %>% mutate(Id = paste(year,
                              month,
                              day,
                              hour,
                              origin,
                              sep = "_")) 


flights = flights %>% mutate(Id = paste(year,
                                        month,
                                        day,
                                        hour,
                                        origin,
                                        sep = "_"))



flights %>% inner_join(weather[,c("Id","temp","humid")],
                       by = c("Id"="Id")) 


vuelos_con_infor_clima = flights %>%
  inner_join(weather[,c("Id","temp","humid")],
             by = c("Id"="Id")) 


names(flights)


