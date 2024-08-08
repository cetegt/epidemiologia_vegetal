# Epidemiología vegetal
# Ejercicio 5
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Este material es una traducción libre con base en el texto  
# Ecology and Epidemiology in R: Disease Progress Over Time
# https://www.apsnet.org/edcenter/disimpactmngmnt/topc/EcologyAndEpidemiologyInR/DiseaseProgress/Pages/default.aspx

# Configure las mediciones del porcentaje de severidad de la enfermedad; 
# puede cambiarlos en análisis posteriores para ver cómo afecta
#el AUDPC
ds0<-1
ds1<-2
ds2<-7
ds3<-7.5

#Coloque estos valores en un vector sin realizar algún cambio
disease.severity<-c(ds0,ds1,ds2,ds3)

#Puntos temporales en los que se harán mediciones 
#de la severidad de la enfermedad, 
#cámbielos en los análisis posteriores
#vea cómo afecta al valor de AUDPC
t0<-0
t1<-2
t2<-5
t3<-6
##Coloque el período de tiempo en un vector
##No cambie esos valores

time.period<-c(t0,t1,t2,t3)

# Refresque su memoria sobre cómo funciona la función de trazado

help(plot)

#Ahora genere la gráfica de la curva de la severidad de la enfermedad bajo el #tiempo

windows(10,10)

plot(time.period,
     disease.severity,
     ylim=c(0,(ds3+1)),
     xlim=c(0,(t3+0.5)),
     xlab="Tiempo",
     ylab="Severidad de la enfermedad (%)",
     type="o",
     pch=19,
     col="mediumblue")

#Agregue el título y subtítulo al gráfico (main= título principal)

title(main="Ilustración del cálculo del AUDPC",
      sub="Figura 1")

#Agregue el texto a las etiquetas de x definiendo los períodos de tiempo
#definidos en el texto

mtext("=t0",1,at=0.3,1)
mtext("=t1",1,at=2.3,1)
mtext("=t2",1,at=5.3,1)
mtext("=t3",1,at=6.3,1)

#Illustre el área bajo el progreso de la enfermedad 
#la curva con rectangulos.

## No cambie esos valores

rect(t0,0,t1,((ds0+ds1)/2),border="orange")

#Agregue texto al rectángulo para describirlo

text(1,1,"A1")

#Agregue segmento al eje Y 
#Y así sucesivamente

rect(t1,0,t2,((ds1+ds2)/2),border="orange")
text(((t1+t2)/2),(((ds1+ds2)/2)/2),"S2")

#Dibuje la línea en el eje X y etiquétela con el valor

segments(.4,((ds1+ds2)/2),t2,((ds1+ds2)/2),
         col="black",lty="18")
text(0,((ds1+ds2)/2),((ds1+ds2)/2))
rect(t2,0,t3,((ds2+ds3)/2),border="orange")
text(((t2+t3)/2),(((ds2+ds3)/2)/2),"S3")
segments(0.4,((ds2+ds3)/2),t2,((ds2+ds3)/2),
         col="black",lty="18")
text(0,((ds2+ds3)/2),((ds2+ds3)/2))

#Construya una función para calcular el AUDPC
#El corchete izquierdo indica el comienzo de la función

audpc <- function(disease.severity,time.period){
  
  #n es el tamaño del período de tiempo, o
  #el número total de muestras
  
  n <- length(time.period)
  
  #meanvec es el vector (matriz de una dimensión)
  #que contendrá la media del porcentaje de infección
  # Se inicializa conteniendo -1 para todas las entradas
  # Este tipo de inicialización es a veces útil
  #para depurar
  
  meanvec <- matrix(-1,(n-1))
  
  #intvec es el vector que contendrá el tamaño del
  #tiempo entre fechas de muestreo
  
  intvec <- matrix(-1,(n-1))
  
  # El bucle (proceso que se repite indefinidamente) va de la primera a la #penúltima entrada 
  # El corchete izquierdo indica el comienzo de
  #los comandos en el bucle
  
  for(i in 1:(n-1)){
    
    #la entrada ith en meanvec es reemplazada por el
    #porcentaje promedio de la infección
    #entre la muestra del tiempo i y la muestra del tiempo i+1
    
    meanvec[i] <- mean(c(disease.severity[i],
                         disease.severity[i+1]))
    
    # La entrada i-ésima en intvec se sustituye por la longitud (tamaño del #vector)del intervalo de tiempo entre el tiempo i y el tiempo i+1
    
    intvec[i] <- time.period[i+1] - time.period[i]
    
    # El corchete derecho termina el bucle
  }
  
  # Los dos vectores se multiplican juntos
  # Una entrada a la vez
  
  infprod <- meanvec * intvec
  
  #la suma de las entradas en el vector resultante
  #proporcionar el AUDPC
  
  sum(infprod)
  
  # El corchete derecho finaliza la función
}


# Ahora aplique la función a los datos de ejemplo y ponga
# el resultado en un nuevo objeto llamado 'AUDPCexample'

audpc(disease.severity,time.period) -> AUDPCexample

#Despliegue el valor del AUDPC 
#Dibuje el rectángulo en torno al valor

rect(0.1,(ds3+.3),2,(ds3+1),border="black")

#Texto AUDPC 

text(1.05,(ds3+0.8),"AUDPC")
text(1.05,(ds3+0.5),AUDPCexample)

#################################################################################

#Ejercicio 3

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