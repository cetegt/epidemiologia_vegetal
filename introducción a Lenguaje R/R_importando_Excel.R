# Epidemiología vegetal
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt

##########################################
# Práctica: Importando datos desde Excel  #
#########################################

remove(list=ls())
if(!require(readxl)){install.packages("readxl")}
if(!require(fBasics)){install.packages("fBasics")}
if(!require(agricolae)){install.packages("agricolae")}

#Estadísticas descriptivas
#Primero debemos importar el archivo DAP_SM

round(basicStats(DAP_SM, ci = 0.95),2)

#attach(DAP_SM) adjuntar las columnas del data.frame
#mean(DAP)
#detach(DAP_SM)

#Medidas estadísticas
summary(DAP_SM$DAP) #Resumen de los 5 números + la media
mean(DAP_SM$DAP)
median(DAP_SM$DAP)
var(DAP_SM$DAP)
sd(DAP_SM$DAP)
CV<-(sd(DAP_SM$DAP)/mean(DAP_SM$DAP))*100;CV

windows()
boxplot(DAP_SM$DAP, ylab="Diámetro a la altura del pecho (cm)")
points(mean(DAP_SM$DAP))

hist(DAP_SM$DAP,  breaks = "Sturges",col = 'green', border = "white",main="Histograma de Pearson",xlab="Clases diamétricas", ylab="Frecuencia absolutas")

hist(DAP_SM$DAP, main="Histograma de Pearson",xlab="Clases diamétricas", ylab="Densidad",probability = TRUE)
lines(density(DAP_SM$DAP), col = 'green', lwd = 3)

#Tabla de frecuencias usando el paquete agricolae
#Consulte: https://rpubs.com/hllinas/R_Tablas_agrupadas

Lista <- hist(DAP_SM$DAP,plot=FALSE); Lista    

Tabla1 <- table.freq(Lista); Tabla1     #La tabla agrupada
