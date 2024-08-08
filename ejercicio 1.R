# Epidemiología vegetal
# Ejercicio 1
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx


## Configure el vector de datos de población de nematodos

npop <- c(220,180,150,250,270,300,500,580,580,1000,380,100)

## Configure el vector de caracteres relacionado con los meses del año

names(npop) <-c (
  "En",
  "Feb",
  "Mar",
  "Abr",
  "May",
  "Jun",
  "Jul",
  "Agt",
  "Sep",
  "Oct",
  "Nov",
  "Dic"
)

## Configure el gráfico de barras de las poblaciones de nematodos, 
#utilice help(barplot) para más información

windows(10,10)
barplot(
  npop,
  axes=FALSE,
  main="Población de nematodos",
  ylim=c(0,1200),
  col="orange",
  xlab="Mes",
  ylab="Nematodos por 100 cc suelo")
axis(2,seq(0,1200,by=200)
)

## Configure el nuevo gráfico que se dibujará encima del gráfico de barras, 
#utilice help(par) para más información
par(new=T)

# Esto establece la temperatura media mensual
# Para la línea por encima de la población

y <-c (15,17,20,24,26,28,30,31,30,28,19,16)

# Esto posiciona los puntos en el eje X
# Correctamente en el medio sobre la parte superior del gráfico de barras..

y2 <-c (0.5,1.45,2.45,3.5,4.5,5.35,6.5,7.6,8.5,9.55,10.65,11.5)

plot(
  y2,
  y,
  ylim=c(0,35),
  xlab=NA,
  ylab=NA,
  xlim=c(0,12),
  axes=FALSE,
  type="o",
  pch=22,
  col="mediumblue"
)

axis(
  4,
  seq(0,35,by=5),
  labels=FALSE
)

## Establezca los puntos para la temperatura

points(
  y2,
  y,
  pch=22,
  col="mediumblue"
)

## Etiquete el eje derecho, consulte help(mtext) para obtener más información

mtext(
  c("0C","5C","10C","15C","20C","25C","30C","35C"),
  4,
  at=seq(0,35,by=5),
  line=.25
)

## Etiquete el eje derecho, consulte help(mtext) para obtener más información

mtext(
  "Temperatura promedio del suelo",
  4,
  line=1,
  cex=1
)

## Debe crear la leyenda
legend(
  "topleft",
  c("Temperatura del suelo","Población de nematodos"),
  pch=c(22,NA),
  lty=c(1,NA),
  col=c("mediumblue",NA),
  inset=0.01
)
## Cree un rectángulo naranja junto a la etiqueta 
## Población de nematodos para la leyenda

rect(-0.2,32.4,0.4,33.4,col="orange")