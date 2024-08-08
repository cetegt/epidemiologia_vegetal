# Epidemiología vegetal
# Ejercicio 4
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx


# Ejemplo de una regresión lineal simple

## Severidad de una enfermedad en función de la temperatura

# Variable de respuesta, severidad de la enfermedad

diseasesev<-c(1.9,3.1,3.3,4.8,5.3,6.1,6.4,7.6,9.8,12.4)

# Variable predictora (dependiente), (centígrados)

temperature<-c(2,1,5,5,20,20,23,10,30,25)

# Revise graficamente la tendencia

windows(10,10)
plot(temperature,diseasesev,main="Diagrama de dispersión",xlab="Temperatura",ylab="Porcentaje de severidad de la enfermedad")

## Por conveniencia, el conjunto de datos puede ser convertido a un objeto tipo data.frame (marco de datos) 

severity <- as.data.frame(cbind(diseasesev,temperature))

## Ajuste un modelo de regresión lineal para los datos y resuma
##   la salida a partir de la función lm()

severity.lm <- lm(diseasesev~temperature,data=severity)

## Genere un resumen del modelo de regresión lineal

summary(severity.lm)

## which=1 produce una gráfica de residuos contra valores ajustados

plot(severity.lm, which=1)

## which=2 produce un gráfico de quantile-quantile (QQ plot)

plot(severity.lm,which=2)

options(digits=4)
fit.with.se<-predict(
  severity.lm,
  se.fit=TRUE
)
data.frame(
  severity,
  fitted.value=predict(severity.lm),
  residual=resid(severity.lm),
  fit.with.se
)

plot(
  diseasesev~temperature,
  data=severity,
  xlab="Temperatura",
  ylab="% Severidad de la enfermedad",
  pch=16
)
abline(severity.lm,lty=1)
title(main="Gráfica del % Severidad de la enfermedad vs Temperatura")

## Valores predichos severidad de la enfermedad para tres nuevas (new) ##temperaturas

new <- data.frame(temperature=c(15,16,17))
predict(
  severity.lm,
  newdata=new,
  interval="confidence"
)