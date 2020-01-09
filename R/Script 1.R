
# Introduccion a R (parte 1)


# 0. Limpiar el espacio de trabajo

    ls()              # Lista de objetos actuales
    rm(list=ls())     # Borrar objetos actuales
    graphics.off()    # Limpia el espacio para las graficas
    options(warn=-1)  # Omite mostrar los warnings
    # Ctrl + L        # Limpia la consola

# 1. Instalar paquetes
    
    install.packages("foreign")
    install.packages("ggplot2")
    install.packages("questionr")
    search() 
    
    library(base)         # Funciones basicas
    library(foreign)      # Manipular diferentes formatos cvs, dta, dbf
    library(questionr)    # Tabulados 
    
#2. Directorio de trabajo
    getwd()                                                   # Directorio actual
    setwd("G:/Mi unidad/SIMO/00476-IGI-2019/Curso/Bases")     # Cambio de directorio
    list.files() 
    

#3. Vectores
    y <- c('A', 'B','A', 'B')           # Vector caracteres
    y[2]                                # Acceder a lo que tiene el vector en la posicion 2
    y[5] <- 'Prepa'                     # Agregar un valor en lugar 5
    y
    
#4. Matrices
    m <- matrix (nrow=2, ncol=3, 1:6)   # Matrices Ejemplo 1
    m
    
#5. Importar datos
    
    cvs<- data.frame(read.table("SDEMT319.csv.CSV", header=TRUE, sep=","))
    
    #5.1. Descripcion de la base
        
        names(cvs)
        head(cvs,2)
        
    #5.2. Frecuencias
        wtd.table(cvs$clase2)
    

#6. Tabulados
    
    wtd.table(cvs$sex,cvs$clase1)
    
    
#7. Etiquetar variables
    
    #7.1 Generar etiquetas
        
        cvs$sex <- factor(cvs$sex,levels = c(1,2),labels = c("Hombre","Mujer"))
        cvs$clase2 <- factor(cvs$clase2,levels = c(1,2,3,4),labels = c("Ocupada","Desocupada","Disponibles","No disponible" ))
        
    #7.2 Tabular variable etiquetada
        
        wtd.table(cvs$sex,cvs$clase2)
        
    
#8. Recodificar variables
    
    #Para poder recodificar una variable de manera correcta, se debe de convertir la variable al tipo de dato deseado, es decir, convertir a numerica o caracter.
    #8.1 Convertir las variables a numerico
    cvs$eda <-as.numeric(as.character(cvs$eda))
    
    #8.2 Crear nueva variable
    cvs$edad_reproductiva<-0
    
    #8.3 Establecer los rangos
    cvs$edad_reproductiva[cvs$eda >= 15 & cvs$eda <=54] <- 1
    cvs$edad_reproductiva[cvs$eda >= 54] <- 2
    
    #8.3 Validar con un tabulado
    wtd.table(cvs$edad_reproductiva)
    
    
#9. Subconjunto de datos
    
    #9.1 Seleccionar variables
    #En R se sigue la logica de un eje de coordenadas: csv [ CASOS , VARIABLES].
        
        #Definimos las variables
        var<-c("sex", "clase2","fac")
        
        #Seleccionamos SoLO esas variables
        nueva_csv_1 <- cvs[,var]
        
    #9.2 Seleccionar casos
        
        nueva_csv_2 <- cvs[ which(as.numeric(cvs$edad_reproductiva)==1), ]
        
    #9.3 Seleccionar variables y casos
        
        nueva_csv_3 <- cvs[ which(as.numeric(cvs$edad_reproductiva)==1),var ]
    
#10. Tabular la nueva variable
    
    wtd.table(nueva_csv_3$sex,nueva_csv_3$clase2)
    wtd.table(nueva_csv_3$sex,nueva_csv_3$clase2, weights =nueva_csv_3$fac)

    
    
    
    