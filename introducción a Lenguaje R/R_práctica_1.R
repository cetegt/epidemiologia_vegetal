# Epidemiología vegetal
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt

remove(list=ls()) #borrar todos los objetos creados anteriormente 

k <- 2.2; k     #constante para convertir de libras a kg o visceversa

# Objeto tipo vector
talla <- c(1.75, 1.63, 1.59, 1.50, 1.63,1.55,1.61,1.75,1.65,1.78,1.60,1.90,1.60,1.40,1.50,1.55,1.45); talla
pesolb <- c(185,160,140,138,130,127,135,180,170,172,167,200,155,120,125,130,128); pesolb
pesokg <- round(pesolb/k,2); pesokg
nombres <- c("Julio","Melvin","Alberto", "Blanca", "Jorge", "Amanda","Roxana","Amílcar","Juan","Roberto","Luis","César","Ricardo","María","Luisa","Carmen","Karen"); nombres
sexo <- c("M","M","M","F","M","F","F","M","M","M","M","M","M","F","F","F","F"); sexo
sexof<- factor(sexo); sexof

# data.frame (Marco de Datos)
datos <- data.frame(nombres,talla,pesolb,pesokg,sexof); datos

datos$nombres
mean(datos$talla)
sd(datos$talla)
cv<-(sd(datos$talla)/mean(datos$talla))*100;cv

attach(datos) #attach = adjuntar

# Promedios
mean(talla)
mean(pesolb)
mean(pesokg)

#Tamaño del vector
length(talla)
length(pesolb)

# Gráfica 
windows(10,10)
plot(talla, pesolb, xlab="Talla (m)", ylab="Peso (lb)", xlim=c(1.4,1.9),main="Grafico de dispersión")

par(mfrow=c(1,1))
boxplot(pesolb~sexof, col="yellow", xlab="Sexo", ylab="Peso en libras")

#Prueba de normalidad de Shapiro-Wilk

#Ho: los datos siguen la distribución normal
#Ha: los datos siguen otra distribución

shapiro.peso<-shapiro.test(pesolb); shapiro.peso

#Es necesario instalar el paquete fBasics

if(!require(fBasics)){install.packages("fBasics")}
if(!require(agricolae)){install.packages("agricolae")}

round(basicStats(talla, ci = 0.95),2)
round(basicStats(pesolb, ci = 0.95),3)
#Separando el grupo de estudiantes por sexo

split(datos,			#objeto a ser separado
      sexof)				#nombre de la columna deseada

datos[datos$sexof=="M",]		#mostrando solo los individuos de sexo masculino
datos[datos$sexof=="F",]
################################################################################

#Correlación

cor(talla,pesolb)
cor.test(talla,pesolb)

#Regresión lineal simple
Reg<-lm(pesolb~talla)
anova(Reg)
summary(Reg)

###########################################################

detach (datos)