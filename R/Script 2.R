
# Introduccion a R (parte 2)

# Nadie hace estadística por gusto, siempre hay un objetivo. 

# Pregunta 1: Quienes estudian mas, los hombres o las mujeres?
# Pregunta 2: Los jovenes estudian mas que los adultos?

#0. Preparar el entorno de trabajo

    rm(list=ls())     
    graphics.off()    
    options(warn=-1) 
    library(base)          
    library(foreign)       
    library(questionr)     
    library(ggplot2)
    library(stats)
    library(dplyr)

    #0.1 Directorio de trabajo
          setwd("G:/Mi unidad/SIMO/00476-IGI-2019/Curso/Bases") 


#2 Importar datos
    enigh<-data.frame(read.dbf("poblacion.dbf"))

#2.1 Descripcion de la base
    names(enigh)
    head(enigh,2)


#3. Subconjuntos (hombres y mujeres)
    #3.1 Convertir a numerico las variables
    
    enigh$sexo <-as.numeric(as.character(enigh$sexo))
    enigh$hor_2 <-as.numeric(as.character(enigh$hor_2))
    enigh$eda <-as.numeric(as.character(enigh$eda))
    
    
    #3.2 Hacer una base para hombres y otra para mujeres
    enigh_h <- enigh[which(enigh$sexo==1),]
    enigh_m <- enigh[which(enigh$sexo==2),]
    

#4. Medidas de tendencia central
    #4.1 Promedio
    mean(enigh_h$hor_2, na.rm = TRUE)
    mean(enigh_m$hor_2, na.rm = TRUE)
    
    #4.2 Mediana
    median(enigh_h$hor_2, na.rm = TRUE)
    median(enigh_m$hor_2, na.rm = TRUE)
    
    #4.3 Minimo
    min(enigh_h$hor_2, na.rm = TRUE)
    min(enigh_m$hor_2, na.rm = TRUE)
    
    #4.4 Maximo
    max(enigh_h$hor_2, na.rm = TRUE)
    max(enigh_m$hor_2, na.rm = TRUE)
    
    #4.5 Desviacion estandar
    sd(enigh_h$hor_2, na.rm = TRUE)
    sd(enigh_m$hor_2, na.rm = TRUE)


#5. Graficas (ggplot)
    #5.1 Grafica simple
    ggplot(enigh,aes(sexo))+geom_bar(fill="blue")
    
    #5.2 Grafica con diseÃ±o
    
    ggplot(enigh,aes(sexo))+geom_bar(fill="blue")+
      xlab("Sexo de las personas")+
      ylab("Numero de personas")+
      ggtitle("Comparacion entre hombres y mujeres")










