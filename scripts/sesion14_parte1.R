setwd("C:\\Users\\hp master\\OneDrive\\Escritorio\\Scidata_cursos\\CDD_R_2022\\mi_data")

dem_score <- read_csv("dem_score.csv")

mis_hojas = c(1:2)

lectura <- function(hoja){
  read_excel("dem_score.xlsx", sheet = hoja)
}

excel_libro <- lapply(mis_hojas,lectura)

class(excel_libro[[1]])

?read_excel


excel_libro[[2]] %>% View()




