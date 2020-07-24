
# Introduccion a R (parte 2)

# Nadie hace estad√≠stica por gusto, siempre hay un objetivo. 

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
          setwd("D:/OneDrive - El Colegio de MÈxico A.C/Desktop/TallerR_UDLAP-master/TallerR_UDLAP-master") 


#2 Importar datos
    enigh<- data.frame(read.table("Survey60-ReportByUser-2020-07-23-01-05-05-prueba.csv", header=TRUE, sep=";"))
          
#2.1 Descripcion de la base
    names(enigh)
    head(enigh,2)


#3. Subconjuntos (hombres y mujeres)
    
    wtd.table(enigh$Genero, enigh$Localizacion)
    wtd.table(enigh$Localizacion)
    

#4. Graficas (ggplot)
    #5.1 Grafica simple
    ggplot(enigh,aes(X.Crees.que.el.Covid.19.es.real.))+geom_bar(fill="blue")
    
    #5.2 Grafica con dise√É¬±o
    
    ggplot(enigh,aes(X.Crees.que.el.Covid.19.es.real.))+geom_bar(fill="blue")+
      xlab("Creencia")+
      ylab("Casos")+
      ggtitle("Covid es real")


#5. Filtros
    
    enigh$Edad <-as.numeric(as.character(enigh$Edad))
    
    # Crear nueva variable
    enigh$jovenes<-0
    
    # Establecer los rangos
    enigh$jovenes[enigh$Edad <=30] <- 1
    
    enigh$jovenes <- factor(enigh$jovenes,levels = c(0,1),labels = c("No joven","JÛven"))
    
    wtd.table(enigh$jovenes)

#6. Una base para los jÛvenes
    
    jovenes<-enigh[which(as.character(enigh$jovenes)=="JÛven"), ]
 
    wtd.table(jovenes$jovenes,jovenes$Genero)

    
#6. Una base para los jÛvenes
    
    ggplot(jovenes,aes(X.Crees.quÈ.el.sistema.de.salud.de.la.isla.esta.bien.dotado.y.preparado.para.combatir.el.virus.))+geom_bar(fill="blue")+
      xlab("Creencia")+
      ylab("Casos")+
      ggtitle("Sistema de salud")
    


