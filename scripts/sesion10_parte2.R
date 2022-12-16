library(tidyverse)
library(nycflights13)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

weather %>%
  group_by(month) %>%
  summarize(media = mean(temp,na.rm=TRUE))

weather %>%
  group_by(origin) %>%
  summarize(min_temp = min(temp,na.rm=TRUE),
            max_temp = max(temp,na.rm=TRUE))

# Temperatura media cada día entre las 8am y las 8 pm

weather %>%
  filter(hour >=8, hour <=20) %>%
  group_by(month,day) %>%
  summarize(temp_media = mean(temp,na.rm=TRUE)) %>%
  arrange(month) %>%
  View()


mis_medidas = weather %>%
  filter(hour >=8, hour <=20) %>%
  group_by(month,day) %>%
  summarize(temp_media = mean(temp,na.rm=TRUE)) %>%
  arrange(month) %>%
  ungroup() %>%
  mutate(month_description = factor(month,labels = month.name))


weather %>%
  select(hour,month,temp,day) %>%
  filter(hour >=8, hour <=20) %>%
  group_by(month,day) %>%
  summarize(temp_media = mean(temp,na.rm=TRUE)) %>%
  arrange(temp_media) %>%
  ungroup() %>%
  mutate(month_description = factor(month,labels = month.name)) 
