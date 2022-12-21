library(tidyverse)
library(nycflights13)

flights %>% names()

19*nrow(flights)

flights %>% select(carrier,flight) %>% View()

flights_no_year <- flights %>% select(-year)

flights_no_year %>% names()

# Así elimino varias columnas a la vez
flights %>% select(-c("year","Id")) 

######################################

flights %>% names()

flights %>% 
  select(month:day, arr_time:arr_delay) %>% names()

######################################

flights %>% names()

flights %>% select(year,month,day,hour,minute,time_hour,
                   everything()) %>% names()

######################################

flights %>% select(starts_with("a")) %>% names()
flights %>% select(ends_with("e")) %>% names()
flights %>% select(contains("time")) %>% names()

######################################

flights %>% select(dep_time,arr_time) %>% 
  rename("departure_time" = dep_time,
         "arrival_time" = arr_time) %>%
  names()

flights %>% select("departure_time"=dep_time,
                   "arrival_tim"=arr_time) %>% names()

##############################################

named_dests_1 <- flights %>%
  group_by(dest) %>%
  summarize(num_flights = n()) %>%
  inner_join(airports[,c("faa","name")], by = c("dest" = "faa")) %>%
  arrange(-num_flights) %>%
  head(10)

named_dests_2 <- flights %>%
  group_by(dest) %>%
  summarize(num_flights = n()) %>%
  inner_join(airports[,c("faa","name")], by = c("dest" = "faa")) %>%
  top_n(10,wt=num_flights) %>%
  arrange(-num_flights)

named_dests_2 == named_dests_1



### arrange siempre ordena de menor a mayor

# 1, 9, 5 y ordenas de mayor a menor 9,5,1
# Es lo mismo que ordenar de menor a mayor a -1, -9, -5 y luego 
# multplicar por -:   -9, -5, -1  ==> 9, 5, 1


################################

mi_data = data.frame("col1" = c("Luis","Ana","Luis"),
                     "col2" = c("h","m","h"),
                     "col3" = c(12,13,12))

mi_data %>% distinct()

mi_data_2 = data.frame("col1" = c("Luis","Ana","Luis"),
                       "col2" = c("h","m","h"),
                       "col3" = c(12,13,10))


mi_data_2 %>% group_by(col1) %>% summarize(conteo = n_distinct(col3))

