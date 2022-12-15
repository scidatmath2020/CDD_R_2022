setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")


dir()

sismos = read.csv("sismos.csv")


magnitud_promedio = mean(sismos$Magnitud)
names(sismos)



sismos %>% 
  filter(mes == 1)

dir()


save.image("objetos_creados_2.RData")


frutas


load("objetos_creados_2.RData")


sismos







#################################################


library(nycflights13)

aeropuertos = c("EWR","JFK","LGA")

mi_guardadora = function(x){

tabla = flights %>% filter(origin == aeropuertos[x])
p = ggplot() +
    geom_point(data = tabla,
               mapping = aes(x=dep_delay,y=arr_delay))
  
nombre_grafica = paste0("grafica_de_",aeropuertos[x],".png")
ggsave(nombre_grafica,plot=p,device="png")
}

lapply(1:3,mi_guardadora)







ggplot() +
  geom_point(data = mis_aeropuertos[[1]],
             mapping = aes(x=dep_delay,y=arr_delay))












