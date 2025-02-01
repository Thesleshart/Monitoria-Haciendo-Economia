# Introducción a R - Haciendo Economía

#TIPS antes de empezar

# Para correr lineas del script windows (ctrl + enter) y Mac (cmd + enter)
# correr todo el script (ctrl + shift + enter) y Mac (cmd+shift + enter)
# Siempre limpiar el environment (memoria de R) antes de empezar a trabajar
# Definir el directorio antes de empezar a trabajar, se hace con: setwd("el path a la carpeta")

# Limpiar  enviroment
rm(list = ls())

#Directorio de trabajo
getwd() #Ver dirección del directorio en uso
dir() # para ver el contenido del directorio actual
set("Dirección archivo") #Para cambiar dirección del directorio actual

# Calculadora en R
3+5 # Suma
5-3 #Resta
5*5 #Multiplicacion
5/5 #Division
5^2 #Exponenciacion 
5%%2 #Residuo de la division
sqrt(4) #Raiz Cuadrada
abs(-11) #Valor Absoluto
log(2) # Log. natural
log10(2) #Log Base 10
var(c(1,3,-2)) #Varianza
sd(c(1,3,-2)) #Desviación estándar
min(c(1,3,-2)) #Mínimo
max(c(1,3,-2)) #Máximo

#Creacion de variables  
variable1 <- 3.6
variable2 = 5
variable3 <- variable1 < variable2 #Les arroja true/false
variable4 <- "Hola"
variable5 <- list("Huevos", "Arepas", "Pan", "Leche")

#Saber que tipo de variables tienen
class(variable1)
class(variable2)
class(variable3)
class(variable4)
class(variable5)

# Para usar las variables con un tipo disitinto al que son, le cambiamos atributo 
#as.numeric() as.integer() as.character()
as.integer(variable1)+variable2 #Se puede
variable1 + as.numeric(variable4) # No se puede porque es texto


#Pedir ayuda en R
help()
# O ?función
?as.integer
#ejemplo 
help("as.integer")
#Vectores
v_numerico <- c(1,2,3,4)
v_numerico2 <- c(1:9)
v_logico <- c(TRUE, FALSE, TRUE, FALSE)
v_texto <- c("Bogota", "Bogota", "Chia", "Sopo")

#Traer un elemento específico []

v_texto[3]  #En R la cuenta empieza desde el 1, ta arroja un valor en especifico

### DATA FRAMES

#A partir de vectores ya creados
datos_personas <- data.frame("ID"=v_numerico, "Hombre" = v_logico, "Residencia" =v_texto)
datos_personas #ver la base de datos en la consola

View(datos_personas) #Ver en nueva ventana


# 1. Instalación de paquetes

install.packages("tidyverse")  # Incluye ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr y forcats
install.packages("readxl")     # Para leer archivos de Excel
install.packages("haven")      # Para leer archivos Stata (DTA)
install.packages("zoo")        # Para análisis de series de tiempo

# 2. Cargar paquetes, llamamos la libreria 
library(tidyverse)
library(readxl)
library(haven)
library(zoo)

# 3. Cargar datos (además del "import dataset"), se puede usar import data set para cargar archivos 

# Leer un archivo de Excel
# data <- read_excel("dirección del archivo.xslx") Hay que cambiar de \ a /

# Leer un archivo CSV
# data_csv <- read_csv("dirección del archivo.csv")

# Leer un archivo Stata (DTA)
# data_dta <- read_dta("dirección del archivo.dta")

# 4. Eliminar filas con valores NA (se pueden especificar columnas)

#data <- data %>% drop_na()

# O eliminar filas con valores NA (de toda la base de datos)
# data <- na.omit(data)

# 5. Eliminar filas duplicadas
#data <- data %>% distinct()
# otra forma es dato_persona$individuo = datos_persona%Id
# 6. Corregir tipos de datos
#data <- data %>% # el %>se usa para editar base
#mutate(
# date_column = ymd(date_column),  # Convertir a fecha
#  factor_column = as.factor(factor_column)  # Convertir a factor
# )


# 5. Renombrar columnas
#data <- data %>% rename(
#new_column_name1 = old_column_name1,
#new_column_name2 = old_column_name2
#)


# 6. Exploración de datos

# Veamos los primeros o últimos registros del dataframe para entender su estructura
# head(data)             Parte superior
#tail(personas)          Parte Inferior

# 7. Análisis descriptivo

# 8. Calcular estadísticas descriptivas básicas
# summary(data)

# 9. Manipulación de datos

#Atajo => ctrl + shift + M => %>% 

# Filtrar datos por condiciones
# filtered_data <- data %>% filter(variable1 > value) (puede ser ==, !=, <, >, <=, >=) 

# Seleccionar columnas específicas
# selected_data <- data %>% select(variable1, variable2, variable3)

# Crear nuevas variables
# data <- data %>% mutate(new_variable = variable1 * variable2)


# 10. Análisis de series temporales
# Convertir a un objeto de series temporales
# ts_data <- zoo(data$value, order.by = data$date)
# plot(ts_data, main = "Series Temporales")

# 11. Visualización de datos

# Gráfico de dispersión
# ggplot(data, aes(x = variable1, y = variable2)) + 
#   geom_point() + 
#   geom_smooth(method = "lm", se = FALSE, color = "blue") +            #También se puede insertar una línea de tendencia 
#   labs(title = "Título del Gráfico", x = "Eje X", y = "Eje Y") 


# Gráfico de líneas para series de tiempo
# ggplot(data, aes(x = date, y = value)) + 
#   geom_line() + 
#   labs(title = "Series Temporales", x = "Fecha", y = "Valor")


# Gráfico de barras
# ggplot(summary_data, aes(x = category, y = mean_value)) + 
#   geom_bar(stat = "identity") + 
#   labs(title = "Promedio por Categoría", x = "Categoría", y = "Valor Promedio")

# 12. Resumir datos por categoría usando group_by y summarise

# summary_data <- data_2020 %>% 
#   group_by(category) %>% 
#   summarise(
#     mean_value = mean(value, na.rm = TRUE), 
#     sum_value = sum(value, na.rm = TRUE),
#     count = n()
#   )

#na.rm=TRUE -> Hacer cálculos eliminando valores NA

# 13. Visualización de los datos resumidos

# ggplot(summary_data, aes(x = category, y = mean_value)) + 
#   geom_bar(stat = "identity") + 
#   labs(title = "Promedio por Categoría en 2020", x = "Categoría", y = "Valor Promedio")

# 14. Cálculo de cuartiles y rango intercuartílico
#Q1 <- quantile(data$column1, 0.25, na.rm = TRUE)
#Q3 <- quantile(data$column1, 0.75, na.rm = TRUE)

# Calcular el rango intercuartil (IQR)
#IQR <- Q3 - Q1

# 15. Condicionales: if y if else

# Ejm 1
edad = 15

if (edad >= 18){
  print("Eres mayor de edad")
}

# Ejm 2

edad = 70
ciudad = "Bogotá"

if (edad >= 60 & ciudad =="Bogotá") {
  print("Es adulto mayor y vive en Bogotá")
}

# Ejm 3
edad = 25

if (edad < 18) {
  print("Menor de edad")
} else if (edad >= 18 & edad < 28) {
  print("Es joven")
} else if (edad >= 28) {
  print("Es adulto")
}

# Ejm 4

nota <- 2.5

if (nota >= 4.5) {
  print("Excelente")
} else if (nota >= 4) {
  print("Sobresaliente")
} else if (nota >= 3) {
  print("Aprobó")
} else {
  print("Reprobó")
}

# 16. Guardar resultados
# write.csv(data, "dirección del documento.csv")





