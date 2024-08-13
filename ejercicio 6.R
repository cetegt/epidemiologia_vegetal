# Epidemiología vegetal
# Ejercicio 6
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx

## Graficando dos curvas

##Configurando la función

plot2 <- function(y1,y2,r1,r2,max1,max2){
  
  # La primera curva 
  curve(
    y1*exp(r1*x),
    from=0,
    to=max1,
    add=FALSE,
    lty=1,
    xlab='Días',
    ylab='Incidencia de la enfermedad',
    col='red',
    xlim=c(0,400),
    ylim=c(0,1)
  )
  
  # La segunda curva
  curve(y2*exp(r2*x),
        from=0,
        to=max2,
        add=TRUE,
        lty=1,
        col='mediumblue'
  )
}

##Ejecutando la función plot2

plot2(0.0017,0.0017,0.01579,0.01661,383,382);

##Creando los títulos para los gráficos y subtítulos en el fondo

title(main="Comparación entre naranja y toronja",
      sub="Modelo de curva Exponencial ")

##Creando las leyendas en la esquina superior izquierda

legend(
  "topleft",
  c("Naranja","Toronja"),
  lty=c(1),
  col=c("red","mediumblue"),
  inset=0.05
)

##################################################################################

## Graficando tres curvas

##Configurando la función
plot3 <- function(y1,y2,y3,r1,r2,r3,max1,max2,max3){
  
  # La primera curva
  
  curve(y1*exp(r1*x),
        from=0,
        to=max1,
        add=FALSE,
        lty=1,
        xlab='Días',
        ylab='Incidencia de la enfermedad',
        col='red',
        xlim=c(0,500),
        ylim=c(0,1)
  )
  
  # La segunda curva
  
  curve(y2*exp(r2*x),
        from=0,
        to=max2,
        add=TRUE,
        lty=1,
        col='mediumblue'
  )
  
  # La tercera curva
  
  curve(y3*exp(r3*x),
        from=0,
        to=max3,
        add=TRUE,
        lty=1,
        col='orange'
  )
}

##Ejecute la función plot3
plot3(0.0017,0.0017,0.001,0.01579,0.01661,0.01466,383,382,463);

##Crear el título para la gráfica y subtítulo al fondo

title(
  main="Comparación entre Naranja, Toronja y Limoncillo",
  sub="Curva del modelo Exponencial"
)

##Creando las leyendas en la esquina superior izquierda

legend(
  "topleft",
  c("Naranja","Toronja","Limoncillo"),
  lty=c(1),
  col=c("red","mediumblue","orange"),
  inset=0.05
)
