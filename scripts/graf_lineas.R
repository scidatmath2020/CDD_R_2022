library(tidyverse)

setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

total_sismos_recientes = read.csv("total_sismos_recientes.csv")


ggplot() +
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=mes_anio,y=Total))

class(total_sismos_recientes$mes_anio)

### Siempre verifica que la columna que se utilizará
### para etiquetar el eje X sea de tipo tiempo

install.packages("zoo")
library(zoo)

as.yearmon(total_sismos_recientes$mes_anio,"%m/%Y")

ggplot() +
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=as.yearmon(mes_anio,"%m/%Y"),y=Total)
            ) +
  labs(x="Mes/Año")

ggplot() +
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=as.yearmon(mes_anio,"%m/%Y"),y=Total,color=factor(anio))
  ) +
  labs(x="Mes/Año")

ggplot() + 
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio))
  ) +
  scale_x_continuous(breaks=1:12,labels=month.name)

class(total_sismos_recientes$mes)
  
  
meses = c("Ene","Feb","Mar","Abr","May","Jun","Jul","Ags","Sep","Oct","Nov","Dic")

ggplot() + 
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio))
  ) +
  scale_x_continuous(breaks=1:12,labels=meses)

ggplot() + 
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio))
  ) +
  scale_x_continuous(breaks=1:12,labels=meses) +
  geom_hline(yintercept = 2213.667)

promedios = total_sismos_recientes %>% group_by(anio) %>% summarize(promedio = mean(Total))

mis_colores = c("black",
                "black",
                "black",
                "black",
                "black",
                "red",
                "black",
                "black",
                "black",
                "black",
                "black")


ggplot() + 
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio))
  ) +
  scale_x_continuous(breaks=1:12,labels=meses) +
  scale_color_manual(values = mis_colores)

ggplot() + 
  geom_line(data = total_sismos_recientes,
            mapping = aes(x=mes,y=Total,color=factor(anio),linetype = factor(anio)),
            size = 0.5
  ) +
  geom_point(data = total_sismos_recientes,
             mapping = aes(x=mes,y=Total,color=factor(anio))
             )+
  scale_x_continuous(breaks=1:12,labels=meses)
  




