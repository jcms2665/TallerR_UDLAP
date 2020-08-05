

library(data.table)
library(dplyr)
library(base)
library(MASS)
library(ggplot2)
rm(list=ls())

#0. Ruta y cargar base
setwd("G:/Mi unidad/SIMO/001ar_nuevos mercados/05082020-Modelos estadísticos")
base<-read.csv("base.csv", sep=",", header = TRUE)
names(base)


######### REGRESIÓN LINEAL

#1. Convertir las variables
base$ingresos<-as.numeric(as.character(base$ingresos))
base$edad<-as.numeric(as.character(base$edad))
base$sexo<-as.factor(as.character(base$sexo))
base$escolaridad<-as.factor(as.character(base$escolaridad))

#2. Ajustar modelo de regresión lineal
m1 <- lm(base$ingresos ~ base$edad+base$sexo+base$escolaridad)

#3. Resultados e interpretación
summary(m1)

######### REGRESIÓN LOGÍSTICA


#4. variables para el modelo de regresión logística

base$usa_barbijo<-as.factor(as.character(base$usa_barbijo))

#5. Ajustar modelo de regresión logística

m2 <- glm(usa_barbijo ~ sexo+edad+escolaridad,
          data = base,
          family = binomial())

#4. Resultados 
summary(m2)

#5. Interpretación (razón de momios)
exp(cbind(OR = coef(m2), confint(m2)))


######### MODELO FACTORIAL


#6. Correlacion
base$escolaridad<-as.numeric(as.character(base$escolaridad))
base$trabajo<-as.numeric(as.character(base$trabajo))
base$cree_covid<-as.numeric(as.character(base$cree_covid))

base1<-base[,c("edad","ingresos","escolaridad","trabajo","cree_covid")]
corr<-round(cor(base1),2)
corr

#7. Ajustar modelo factorial
fit <- factanal(base1, 2)


#8. Interpretacion de los factores

load <- fit$loadings[,1:2]

load
