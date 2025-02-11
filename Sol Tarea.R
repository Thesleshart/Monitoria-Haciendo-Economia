# Limpiar  enviroment
rm(list = ls())

install.packages("readxl")
library("readxl")

install.packages("haven") # para abrir archivos .dta
library(haven)

install.packages("janitor") # para mostrar estadisticas basicas
library(janitor)

# RUTA MODIFICABLE SEGUN LA PERSONA QUE UTILICE EL CODIGO (CARPETA RAIZ TALLER1)

datos_g  <- read_dta("C:/Users/sebas/OneDrive/Escritorio/Universidad/Tercer Semestre/HC/TALLER1/DATOS/TenderosFU03_BLandFUmerged_pub.dta")

datos_s <- read_dta("C:/Users/sebas/OneDrive/Escritorio/Universidad/Tercer Semestre/HC/TALLER1/DATOS/TenderosFU03_Publica.dta")

#escojo la variables que voy a utilizar de la base de datos  TenderosFU03_BLandFUmerged_pub
datos_ng = data.frame(municipio = datos_g$Munic_Dept, act1 = datos_g$actG1, act2 = datos_g$actG2, act3 = datos_g$actG3, act4 = datos_g$actG4, 
                      act5 = datos_g$actG5, act6 = datos_g$actG6, act7 = datos_g$actG7, act8 = datos_g$actG8, act9 = datos_g$actG9, act10 = datos_g$actG10, 
                      act11 = datos_g$actG11)

#redusco la base de  datos escogiendo las variables a utilizar de la base de datos TenderosFU03_Publica
datos_ns = data.frame(municipio = datos_s$Munic_Dept, act1 = datos_s$actG1, act2 = datos_s$actG2, act3 = datos_s$actG3, act4 = datos_s$actG4, 
                      act5 = datos_s$actG5, act6 = datos_s$actG6, act7 = datos_s$actG7, act8 = datos_s$actG8, act9 = datos_s$actG9, act10 = datos_s$actG10, 
                      act11 = datos_s$actG11)

#utilizo la  funcion merge( base de datos1, base de datos2, la variable por la que voy a combinarla, parametro obligatorio) y almaceno todo en una nueva variable
datos_maged = merge(datos_ng, datos_ns, by ="municipio", all = TRUE)

#recopilo los datos de l avariable municipio
datos_maged$municipio = as.factor(datos_maged$municipio)
tabyl(datos_maged$municipio)  #tabulo los datos

#hola