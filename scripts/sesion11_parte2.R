library(tidyverse)
library(nycflights13)

names(weather)


weather %>%
  mutate(temp_en_C = (temp-32)/1.8) 

climas_con_tem_en_C = weather %>%
  mutate(temp_en_C = (temp-32)/1.8) 

climas_con_tem_en_C %>%
  group_by(month) %>%
  summarize(F_prom = mean(temp,na.rm=TRUE),
            C_prom = mean(temp_en_C,na.rm=TRUE)
            )

tabla_temperaturas_mensuales = climas_con_tem_en_C %>%
  group_by(month) %>%
  summarize(F_prom = mean(temp,na.rm=TRUE),
            C_prom = mean(temp_en_C,na.rm=TRUE)
  )


tabla_temperaturas_mensuales %>% filter(month %in% c(6,7,8))

############################################


flights <- flights %>% 
  mutate(gain = dep_delay - arr_delay)

names(flights)

flights %>% 
  select(dep_delay,arr_delay,gain) %>%
  head(5)


gain_summary <- flights %>% 
  summarize(
    min = min(gain, na.rm = TRUE),
    q1 = quantile(gain, 0.25, na.rm = TRUE),
    median = quantile(gain, 0.5, na.rm = TRUE),
    q3 = quantile(gain, 0.75, na.rm = TRUE),
    max = max(gain, na.rm = TRUE),
    mean = mean(gain, na.rm = TRUE),
    sd = sd(gain, na.rm = TRUE),
    missing = sum(is.na(gain))
  )

gain_summary


ggplot() +
  geom_histogram(data = flights,
                 mapping = aes(x = gain),
                 color = "white",
                 bins = 20)

ggplot() +
  geom_density(data = flights,
                 mapping = aes(x = gain),
                 color = "black",
                 fill = "yellow"
                 )



flights <- flights %>% 
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
  )

flights <- flights %>% 
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
    ganancia_perdida = ifelse(gain >= 0,"+","-")
  )

View(flights)

