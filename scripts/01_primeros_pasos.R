# -----------------------------------------------------------------------------
# Autor: Camila Ignacia Bravo Figueroa
# Fecha: 24-08-2026
# Descripción:
# Calcula el gasto mensual estimado en café utilizando precios de distintas 
# cafeterías.
# -----------------------------------------------------------------------------

# Carga los datos desde la carpeta data/raw
datos <- read.csv("data/raw/precio_cafe.csv")    

# Visualiza las primeras filas del conjunto de datos
head(datos)

# Muestra la estructura del conjunto de datos
str(datos)
# La variable precio aparece como "chr" (character), por lo que está almacenada
# como texto.

# Comprueba que la variable precio no es numerica
is.numeric(datos$precio)
# El resultado es FALSE, por lo que será necesario limpiar los datos antes de
# realizar cálculos.


# Crea una copia de los datos para trabajar, sin modificar los datos originales
# almacenados en data/raw
datos_limpios <- datos

# Elimina el signo $ de la variable precio
datos_limpios$precio <-gsub("\\$", "", datos_limpios$precio)

# Elimina el punto utilizado como separador de miles
datos_limpios$precio <- gsub("\\.", "", datos_limpios$precio)

# Convierte la variable precio a formato numérico
datos_limpios$precio <- as.numeric(datos_limpios$precio)

# Comprueba que la variable precio ahora es numérica
is.numeric(datos_limpios$precio)
# El resultado es TRUE, por lo que ahora podemos realizar cálculos utilizando 
# la variable precio.

# Muestra la estructura de los datos limpios
str(datos_limpios)

# Guarda una versión limpia de los datos en la carpeta data/processed
write.csv(datos_limpios,"data/processed/precio_cafe_limpio.csv",row.names = FALSE)

# Los datos originales permanecen en data/raw, mientras que la versión procesada
# se guarda en data/processed.

# -----------------------------------------------------------------------------

# Calcula el precio promedio del café
precio_promedio <- mean(datos_limpios$precio)

# Cantidad estimada de cafés consumidos por semana
cafes_por_semana <- 3

# Cantidad de semanas consideradas por mes
semanas_por_mes <- 4

# Calcula el gasto mensual estimado en café
gasto_mensual <- precio_promedio * cafes_por_Semana * semanas_por_mes

#Muestra el precio promedio del café
precio_promedio

# Muestra el gasto mensual estimado
gasto_mensual

# Crea una tabla resumen con los principales resultados
resumen <- data.frame(precio_promedio = precio_promedio, cafes_por_Semana = cafes_por_Semana, semanas_por_mes = semanas_por_mes, gasto_mensual = gasto_mensual)

# Guarda los resultados finales en la carpeta output/tablas
write.csv(resumen, "output/tablas/resumen_gasto_cafe.csv", row.names = FALSE)
# El archivo resumen_gasto_cafe.csv contiene los principales resultados del 
# análisis.

# Verifica que el archivo fue creado correctamente
list.files("output/tablas")

# -----------------------------------------------------------------------------
# Interpretación:
# El precio promedio observado entre las cafeterías analizadas es de $4.136 por 
# café. Considerando un consumo de tres cafés por semana durante cuatro semanas
# al mes, el gasto mensual estimado en café es de $49.632.
# -----------------------------------------------------------------------------
