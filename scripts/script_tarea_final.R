library(tidyverse)
setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\mapa_corrupcion")
load("tper_vic.RData")


actividades = tper_vic %>% select(CVE_ENT,
                                  starts_with("AP5_1"),
                                  FAC_ELE)



actividades_tidy = actividades %>%
  pivot_longer(names_to="actividad",
               values_to="respuesta",
               cols= starts_with("AP5_1")) %>%
  filter(respuesta == 1) %>%
  group_by(CVE_ENT,actividad) %>%
  summarize(total = sum(FAC_ELE))


poblacion = tper_vic %>% select(CVE_ENT,FAC_ELE) %>%
  group_by(CVE_ENT) %>%
  summarize(poblacion = sum(FAC_ELE))


descriptor_actividades = data.frame(actividad = c('AP5_1_01',
                                                  'AP5_1_02',
                                                  'AP5_1_03',
                                                  'AP5_1_04',
                                                  'AP5_1_05',
                                                  'AP5_1_06',
                                                  'AP5_1_07',
                                                  'AP5_1_08',
                                                  'AP5_1_09',
                                                  'AP5_1_10',
                                                  'AP5_1_11',
                                                  'AP5_1_12',
                                                  'AP5_1_13'),
                                    descripcion = c('Construcción/mantenimiento de parques',
                                                    'Mejorar alumbrado',
                                                    'Mejorar el ingreso de las familias',
                                                    'Atender el desempleo',
                                                    'Atención a los jóvenes',
                                                    'Organización de los vecinos para contratar seguridad privada',
                                                    'Policía de barrio para que coordine la seguridad de la colonia',
                                                    'Operativos contra la delincuencia',
                                                    'Programas de sensibilización para que la gente denuncie',
                                                    'Mayor vigilancia policiaca',
                                                    'Combatir la corrupción',
                                                    'Combatir el narcotráfico',
                                                    'Otra')
)


actividades_tidy = actividades_tidy %>% left_join(poblacion) %>% 
  mutate(porcentaje = total*100/poblacion) %>%
  left_join(descriptor_actividades) %>%
  select(CVE_ENT,descripcion,porcentaje)


mapa = read.csv("Mexico_division_politica.csv")
mexico = mapa %>% mutate(Entidad = as.integer(Grupo))
mapa_final = mexico %>% left_join(actividades_tidy, 
                                  by = c("Entidad"="CVE_ENT"))

##############################################
##############################################
##############################################

ggplot() +
  geom_polygon(data = mapa_final,
               mapping = aes(x=Longitud,
                             y=Latitud,
                             group=Grupo,
                             fill = porcentaje)) +
  scale_fill_gradient(low = "yellow",
                      high = "darkred",
                      na.value = NA,
                      name="Porcentaje de personas que indicaron\nque la actividad se llevó a cabo en su municipio") +
  coord_map(xlim=c(-117,-87),
            ylim=c(14,32)) +
  theme(legend.position="top",
        panel.background = element_rect("#202020"), 
        panel.grid = element_blank(),
        axis.title = element_blank(), 
        axis.text = element_blank(), 
        axis.ticks = element_blank(),
        plot.title = element_text(face="bold.italic")
  ) +
  facet_wrap(.~descripcion,ncol=5) +
  labs(title = "Población de 18 años y más que indicaron\nque la actividad se llevó a cabo en su municipio", 
       subtitle = "Fuente: ENVIPE 2022, INEGI") 


##############################################
##############################################
##############################################

mapa_puebla = mexico %>% 
  left_join(actividades_tidy, 
            by = c("Entidad"="CVE_ENT")) %>% 
  filter(Entidad == 21)

mapa_puebla %>% summarize(longitud_min = min(Longitud),
                          longitud_max = max(Longitud),
                          latitud_min = min(Latitud),
                          latitud_max = max(Latitud))


ggplot() +
  geom_polygon(data = mapa_puebla,
               mapping = aes(x=Longitud,
                             y=Latitud,
                             group=Grupo,
                             fill = porcentaje)) +
  scale_fill_gradient(low = "yellow",
                      high = "darkred",
                      na.value = NA,
                      name="Porcentaje de personas que indicaron\nque la actividad se llevó a cabo en su municipio") +
  coord_map(xlim=c(-100,-95),
            ylim=c(17,22)) +
  theme(legend.position="top",
        panel.background = element_rect("#202020"), 
        panel.grid = element_blank(),
        axis.title = element_blank(), 
        axis.text = element_blank(), 
        axis.ticks = element_blank(),
        plot.title = element_text(face="bold.italic")
  ) +
  facet_wrap(.~descripcion,ncol=5) +
  labs(title = "Población de 18 años y más que indicaron\nque la actividad se llevó a cabo en su municipio", 
       subtitle = "Fuente: ENVIPE 2022, INEGI") 
