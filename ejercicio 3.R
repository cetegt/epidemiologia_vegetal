# Epidemiología vegetal
# Ejercicio 3
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx


## Configure el vector para el gráfico de AUDPC, de la localidad de Madras 
##  DAI = Days After Inoculation (días después de la inoculación)

daysAfterInoculation <- c(0,10,20,30,40,50,60,70,80,90,100)
severityYear68 <- c(0,0,0,0,3,20,50,80, 90, 100, 100)
severityYear69 <- c( 0,0,0,0,0,0,0,3,6,30,70)

## Configure la línea de la gráfica para 1968

plot(
  daysAfterInoculation,
  severityYear68,
  type="o",
  pch=22,
  col="mediumblue",
  ylim=c(0,100),
  xlab='Días después de la inoculación',
  ylab='% Infección'
)

## Establezca el título principal

title(main="Progreso de la enfermedad en Madras, Oregon")

## Línea de superposición para el gráfico de 1969

lines(
  daysAfterInoculation,
  severityYear69,
  type="o", col="orange"
)

## Establezca la leyenda del gráfico en la esquina superior izquierda

legend(
  "topleft",
  c("1968","1969"),
  pch= c(22,21),
  lty=1,
  col = c("mediumblue","orange"),
  title="Año",
  inset=0.05
)

## Calcule el AUDPC usando la función llamada 'audpc' que
##      fue creada en el AUDPC exercise de este documento
## Si usted ha iniciado una nueva sesión de R y no ha salvado
##      la función usted necesitará crearla nuevamente.
## Para comprobar que tiene disponible la función, intente
##      ingresar el nombre de la función, 'audpc', en la línea de comando
##      y R retornará el contenido de la función.
# Calcule el AUDPC para 1968

audpc(severityYear68,daysAfterInoculation)

# Calcule el AUDPC para 1969

audpc(severityYear69,daysAfterInoculation)





