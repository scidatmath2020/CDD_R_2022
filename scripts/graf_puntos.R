library(tidyverse)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

## Cuando algo termina en .algo (en este caso .csv), se trata de un archivo

alaska_flights = read.csv("alaska.csv")

names(alaska_flights)
str(alaska_flights)


View(alaska_flights)


ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x=dep_delay,y=arr_delay)
             ) +
  geom_abline(slope=1,intercept=0,color="red")


# La barra vertical | siginfica "o" (disyunción)

alaska_flights[is.na(alaska_flights$dep_delay) 
               | 
               is.na(alaska_flights$arr_delay),]


is.na(c(1,5,NA,8,2,3,NA,7)) #NA = not allowable

faltantes = alaska_flights[is.na(alaska_flights$dep_delay) 
                           | 
                             is.na(alaska_flights$arr_delay),]

View(faltantes)

####################################################

# Agregar transparencias
ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x=dep_delay,y=arr_delay),alpha=0.1,size=3
  ) +
  geom_abline(slope=1,intercept=0,color="red")

###################################################


mi_data = data.frame("X"=c(0,0,0,0),"Y"=c(0,0,0,0))

mi_data

ggplot() +
  geom_jitter(data=mi_data,mapping = aes(x=X,y=Y))

# Agregar nerviosismo
ggplot() +
  geom_jitter(data = alaska_flights,
             mapping = aes(x=dep_delay,y=arr_delay),alpha=0.1,size=3
  ) +
  geom_abline(slope=1,intercept=0,color="red")


# Agregar nerviosismo manualmente

ggplot() +
  geom_jitter(data = alaska_flights,
              mapping = aes(x=dep_delay,y=arr_delay),width=0.5,
              height = 0, 
              alpha=0.1,size=3
  ) +
  geom_abline(slope=1,intercept=0,color="red")


#################################################


matriculas = alaska_flights %>% 
  group_by(tailnum) %>%
  count() %>%
  rename(Total = n)


matriculas

ggplot() +
  geom_point(data=matriculas,
            mapping = aes(x=tailnum,y=Total)) +
  theme(axis.text.x = element_text(angle=90))

########################################################

ggplot() +
  geom_point(data = alaska_flights,
             mapping = aes(x=tailnum,y=arr_delay,color=factor(month))
  )  +
  theme(axis.text.x = element_text(angle=90))


