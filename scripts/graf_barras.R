library(tidyverse)
library(nycflights13)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")


frutas <- data.frame(tipo = c("manzana", 
                              "manzana", 
                              "naranja", 
                              "manzana", 
                              "naranja"))

frutas_contadas <- data.frame(tipo = c("manzana", "naranja"),
                              total = c(3, 2))


ggplot() +
  geom_bar(data = frutas, mapping = aes(x = tipo),
           fill= "red",
           color = "black")


ggplot() +
  geom_bar(data = frutas, mapping = aes(x = tipo,fill= tipo),
           color = "black")


names(frutas_contadas)

ggplot() +
  geom_bar(data = frutas_contadas, 
           mapping = aes(x = tipo,fill= tipo),
           color = "black")


###################################

ggplot() +
  geom_col(data = frutas_contadas, 
           mapping = aes(x = tipo, y = total,fill=tipo),
           color = "black")


frutas_contadas


#####################################

names(flights)

head(flights,10)

ggplot()+
  geom_bar(data = flights,
           mapping = aes(x=carrier,fill=carrier))

table(flights$carrier)

nrow(flights)

#######################################

vuelos_contados <- data.frame(aerolinea = c("9E","AA","AS","B6","DL","EV","F9","FL","HA","MQ","OO","UA","US","VX","WN","YV"),
                              total_vuelos = c(18460,32729,714,54635,48110,54173,685,3260,342,26397,32,58665,20536,5162,12275,601))


vuelos_contados

ggplot()+
  geom_col(data = vuelos_contados,
           mapping = aes(x=aerolinea,y=total_vuelos),
           fill = "steelblue")

########################################################

ggplot() + 
  geom_bar(data = flights, mapping = aes(x = carrier,fill=origin))


table(flights$carrier,flights$origin)

ggplot() + 
  geom_bar(data = flights, 
           mapping = aes(x = carrier,fill=origin),
           position = "dodge")


ggplot() +
  geom_bar(data = flights, 
           mapping = aes(x = carrier, fill = origin),
           position = position_dodge(preserve = "single"))



ggplot() +
  geom_bar(data = flights,
           mapping = aes(x = carrier,fill=origin)) +
  facet_wrap(~ origin, ncol = 1)


# virgulilla: ~
#######################################################

ggplot() +
  geom_bar(data = flights,
           mapping = aes(x = carrier,fill = carrier)) +
  geom_text(data = valores,
            mapping = aes(x=1:16,y=total+1500,color=carrier,label = total),
            angle =45) +
  labs(y="Total",x="Aerolínea") +
  coord_flip() +
  labs(title = "Frecuencia de vuelos por aerolínea",
       subtitle = "En el año 2013 desde NY") +
  theme(
    panel.background = element_rect("white"), 
    panel.grid = element_blank(),
    )
  



valores = as.data.frame(table(flights$carrier))
names(valores) = c("carrier","total")




           











