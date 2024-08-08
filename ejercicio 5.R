# Epidemiología vegetal
# Ejercicio 5
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx


# Ejemplos de modelos probabilísticos para ajustes de curvas de progreso de la enfermedad

# Crecimiento logístico de las enfermedades de las plantas

## Ingrese el conjunto de datos que incluye las variables tiempo,
#  ID (identificación de la planta), y severidad

time <- c(seq(0,10),seq(0,10),seq(0,10))
plant <- c(rep(1,11),rep(2,11),rep(3,11))

## La severidad representa el número de
## lesiones en la superficie de la hoja, estandarizada
## como una proporción de la máxima cantidad de lesiones

severity <- c(
  42,51,59,64,76,93,106,125,149,171,199,
  40,49,58,72,84,103,122,138,162,187,209,
  41,49,57,71,89,112,146,174,218,250,288)/288

data1 <- data.frame(
  cbind(
    time,
    plant,
    severity
  )
)

## Gráfico de la severidad contra el tiempo 
## para ver la relación entre
## las dos variables para cada planta

plot(
  data1$time,
  data1$severity,
  xlab="Tiempo",
  ylab="Severidad",
  type="n"
)
text(
  data1$time,
  data1$severity,
  data1$plant
)
title(main="Gráfico de la severidad contra el tiempo")

#Valor inicial de los parámetros

getInitial(
  severity ~ SSlogis(time, alpha, xmid, scale),
  data = data1
)

## Usando el valor inicial de los parâmetros obtenidos arriba,
## ajuste a los datos una curva logística.

para0.st <- c(
  alpha=2.212,
  beta=12.507/4.572, # beta en nuestro modelo es xmid/scale
  gama=1/4.572 # gamma (o r) es 1/scale
)

fit0 <- nls(
  severity~alpha/(1+exp(beta-gama*time)),
  data1,
  start=para0.st,
  trace=T
)

## Grafique para ver cómo el modelo se ajusta a los datos; 
## grafique la curva logística en un diagrama de dispersió (scatter plot).

plot(
  data1$time,
  data1$severity,
  type="n", 
  xlab="Tiempo",
  ylab="Severidad"
)
text(
  data1$time,
  data1$severity,
  data1$plant
)
title(main="Gráfico de la severidad contra el tiempo")

curve(
  2.21/(1+exp(2.74-0.22*x)),
  from=time[1],
  to=time[11],
  add=TRUE
)

#################################################################################

## Ejemplo de modelo exponencial 

plotexp <- function(y0,r,maxt){
  curve(
    y0*exp(r*x),
    from=0,
    to=maxt,
    xlab='Tiempo',
    ylab='Incidencia de la enfermedad',
    col='mediumblue')
}
plotexp(0.0017, 0.01579, 100)

#################################################################################

## Ejemplo de modelo monomolecular

plotmono <- function(y0,r,maxt){
  curve(
    1-(1-y0)*exp(-r*x),
    from=0,
    to=maxt,
    xlab='Tiempo',
    ylab='Incidencia de la enfermedad',
    col='mediumblue')
}
plotmono(0.0017, 0.00242, 2000)

#################################################################################

## Ejemplo de modelo logístico

plotlog <- function(y0,r,maxt){
  curve(
    1/(1+(1-y0)/y0*exp(-r*x)),
    from=0,
    to=maxt,
    xlab='Tiempo',
    ylab='Incidencia de la enfermedad',
    col='mediumblue'
  )
}
plotlog(0.001, 0.01636, 1000)

#################################################################################

## Ejemplo de modelo Gompertz 

plotgomp <- function(y0,r,maxt){
  curve(
    exp(log(y0)*exp(-r*x)),
    from=0, to=maxt, xlab='Tiempo',
    ylab='Incidencia de la enfermedad',
    col='mediumblue'
  )
}
plotgomp(0.0017,0.02922, 250)

#################################################################################

## Ejemplo de modelo Weibull 

plotweib <- function(a,b,c,maxt){
  curve(
    1-exp(-((x-a)/b)^c),
    from=0,
    to=maxt,
    xlab='Tiempo',
    ylab='Incidencia de la enfermedad',
    col='mediumblue'
  )
}
plotweib(1, 331.10, 10.04, 500)

##################################################################################