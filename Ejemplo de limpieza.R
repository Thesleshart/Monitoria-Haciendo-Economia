
#Este archivo limpia la base de sobre la encuensta
#por: Sebastian Cano Aarias
#Cuando: /28/10/2024
#Requiere
# -Encuesta_sobre_ambientes_escolares_RAW
# - notas ejercicio.csv
#genera una base limpia

# 1.limpiar hambiente ====
rm(list = ls())

# 2.intalar paquetes ====
#install.packages("readxl")
#install.packages("dplyr")
library(dplyr)
library(readxl)
library(readr)

#3. Importar la base de datos ====
  data <- read_excel("Data/Encuesta sobre ambientes escolares RAW.xlsx")
notae <- read_delim("Data/notasEjercicio.csv", 
                    delim = ";", escape_double = FALSE, trim_ws = TRUE)

#4. Nombre de variables ====
data <- data %>% rename( asistencia_ICE  = "¿Ha cursado Intro a la Ciencia Económica?")
data <- data %>% rename( dificultad_ICE  = "En general, ¿qué tan difícil fue esta materia?...5" )
data <- data %>% rename( nota_ICE_presencial  = "¿Cuál fue su nota de esta clase?...7" )
data <- data %>% rename( nota_ICE_virtual  =  "¿Cuál cree hubiese sido su nota si hubiese sido 100% virtual?...8" )
data <- data %>% rename( asistencia_calculo =  "¿Cursó la asignatura Pre-cálculo o Cálculo I?")
data <- data %>% rename( dificultad_calculo = "En general, ¿qué tan difícil fue esta materia?...10")
data <- data %>% rename(  nota_calculo_presencial = "¿Cuál fue su nota de esta clase?...12")
data <- data %>% rename(   nota_calculo_virtual= "¿Cuál cree hubiese sido su nota si hubiese sido 100% virtual?...13")
notae <- notae %>% rename( id =  "Número de ID")
names(data)
names(notae)

# 5. Reshape ====
fulldata <- full_join(data, notae, by = "id")

# 6.limpiar la base de datos====
fulldata_clean <- na.omit(fulldata)
names(fulldata)

#6. Validacion notas ====

fulldata_clean$nota_ICE_presencial[fulldata_clean$nota_ICE_presencial == 44] <- 4.4
fulldata_clean$nota_ICE_virtual[fulldata_clean$nota_ICE_virtual == 44] <- 4.4
fulldata_clean$nota_calculo_presencial[fulldata_clean$nota_calculo_presencial == 46] <- 4.6
fulldata_clean$nota_calculo_presencial <- gsub(".* - (.*)", "\\1", fulldata_clean$nota_calculo_presencial)
fulldata_clean$nota_calculo_virtual[fulldata_clean$nota_calculo_virtual == 50] <- 5.0

fulldata_clean <- fulldata_clean %>%
  mutate(nota = round(nota, 1))

fulldata_clean <- fulldata_clean %>%
  mutate_at(vars(nota_ICE_presencial, nota_ICE_virtual, nota_calculo_presencial, nota_calculo_virtual), ~ as.numeric(gsub(",", ".", .)))

fulldata_clean <- fulldata_clean %>%
  mutate_at(vars(nota_ICE_presencial, nota_ICE_virtual, nota_calculo_presencial, nota_calculo_virtual), ~ as.numeric(gsub(",", ".", .)))

#7. Guardar los datos ====
save(fulldata_clean, file = "datoslimpios.cvs")