#Ejercicio para arreglar una base de datos 
# Limpiar  enviroment
rm(list = ls())

#install.packages("readr")
#install.packages("dplyr")
#install.packages("readxl")
library(dplyr)
library(readxl)
library(readr)

#importar la base de datos
data <- read_excel("Base a areglar.xlsx")

#Nombre de las variables
data <- data %>% rename( tipo  = "tipo_bicicleta_mas_vendido")
data <- data %>% rename( deporte  = "deporte_entrenamiento" )
data <- data %>% rename( profecional = "competencia_profesional" )
data <- data %>% rename( caracteristica  =  "característica_mas_valorada" )
data <- data %>% rename( canal =  "canal_venta_mas_exitoso" )
data <- data %>% rename( retos = "retos_para_aumentar/mantener_ventas")
data <- data %>% rename( edades  = "principal_grupo_de_edad")
data <- data %>% rename( ventas = "bicicletas_vendidas_año")
names(data)

class(data$transporte_diario)
data$transporte_diario <- as.numeric(data$transporte_diario)
data$transporte_diario <- round(data$transporte_diario, digits = 0)

data$recreacion_ocio[data$recreacion_ocio == 45781] <- 4
data$edades[data$edades == "Elle"] <- "Adulto"
data$edades[data$edades == "Ello"]<- "Adulto"
data$tipo[data$tipo == "Moto"]<- "Montaña (MTB)"
data$ventas[data$ventas == 3000000] <- 300

ndatos <- data %>% 
  select(tipo,rango_precios,transporte_diario,recreacion_ocio,deporte,profecional,total,epoca_mayores_ventas,
         caracteristica, servicio_postventa, canal, cambio_preferencias, clientes_habituales, retos, edades, ventas)

#. Guardar los datos
save(data, file = "datoslimpios.cvs")










