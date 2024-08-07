# Epidemiología vegetal
# Ejercicio 2
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt
# Con base en el texto de 


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

