#install.packages("fivethirtyeight")
library(fivethirtyeight)
library(tidyverse)

drinks_smaller <- drinks %>%
  filter(country %in% c("USA",
                        "China",
                        "Italy",
                        "Saudi Arabia",
                        "Mexico")) %>%
  select(-total_litres_of_pure_alcohol) %>%
  rename(beer = beer_servings, 
         spirit = spirit_servings,
         wine = wine_servings)

drinks_smaller

drinks_smaller_tidy <- drinks_smaller %>% 
  pivot_longer(names_to = "type", 
               values_to = "servings", 
               cols = -country)

drinks_smaller_tidy

#type servings  country 
#beer   79       China
#beer   85       Italy
#beer   238      Mexico
#beer    0       Saudi Arabi
#beer   249      USA
#spirit 192      China
#spirit 42       ...
#...             ...           
#wine    84      USA

drinks_smaller

mi_extractor <- function(x){
  auxiliar = drinks_smaller[,x]
  auxiliar$type = names(drinks_smaller)[x]
  auxiliar$country = drink_smaller$country
  names(auxiliar)[1] = "servings"
  return(auxiliar)
}

mis_tablas = lapply(2:4,mi_extractor)

resultado = do.call(rbind,mis_tablas)

resultado

ggplot() +
  geom_col(data = drinks_smaller_tidy,
           mapping = aes(x=country,y=servings,fill=type),
           position = "dodge")

drinks_smaller

ggplot(data = drinks_smaller) + 
  geom_col(mapping = aes(x=country,y=beer),alpha=0.5,fill="red") +
  geom_col(mapping = aes(x=country,y=spirit),alpha=0.5,fill="blue") +
  geom_col(mapping = aes(x=country,y=wine),alpha=0.5,fill = "green")
  





