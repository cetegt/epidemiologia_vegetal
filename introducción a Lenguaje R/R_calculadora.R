# Epidemiología vegetal
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt

citation ()
citation("agricolae")

#Solicitando información sobre los paquetes
packageDescription("stats")
help(package = "stats")

##############################################

# Primer contacto con el lenguaje R
#Visite el sitio web del CENTRO DE TELEMÁTICA (CETE): cete.fausac.gt
#El R como una calculadora

#La forma de uso más básica del R es usarlo como calculadora. Los operadores matemáticos básicos son: 
# + para suma, 
# - subtracción,
# * multiplicación, 
# / división e  
# ^ exponenciación. Alt + 94 ^

# Digite las seguientes operaciones en la línea de comandos del R:
2+2
2*2
2/2
2-2
2^2;2**3;10/2;3**2

17/4
17%/%4  # cociente de la división
round(17%%4,3)   # resíduo de la división

# Use paréntesis para separar partes de los cálculos, por ejemplo, para realizar el cálculo 4+16, dividido por 4, elevado al cuadrado:

((4+16)/4)^2

# Usando algunas funciones

sqrt(9)          #  raíz cuadrada de los argumentos entre paréntesis, para este caso 9
sqrt(3*3^2)      #  raíz cuadrada de 27
sqrt((3*3)^2)    # raíz cuadrada de 81
sqrt(81)
# prod es la función para multiplicación

prod(2,2)          # lo mismo que 2x2
prod(2,2,3,4)    # 2x2x3x4

#log es la función para calcular el logaritmo

log(3)             # log natural de 3
log(3,10)        # log de 3 en la base 10
log10(3)         # lo mismo que lo anterior: log 3 en la base 10

#exp devuelve e elevado a la potencia de un número. La constante e es igual a 2.71828182845904....., la base del logaritmo natural.

exp(3)
exp(-2)

round(exp(3),3)  	# Vea que pasa cuando usa la función round (redondea al número de decimales indicados)

signif(exp(3),3)  	# Y cuando usa la función signif (da el número de cifras significativas indicadas)

floor (4.3)  		#redondea hacia abajo

ceiling (4.7)		#redondea hacia arriba

log(exp(3))

# abs es la función para obtener los valores en módulo

abs(3-9)     # abs = módulo, |3-9|

#Para obtener el fatorial de algun número use factorial()

factorial(4)   #4 factorial (4! = 4 x 3 x 2 x 1)
factorial(0)

#Funciones trigonométricas

sin(-2*pi)
cos(pi)
tan(pi)

#Más adelante veremos otras funciones y comandos del R.

#Nombrando un objeto

k<-2.2;k    #constante para trasladar valor de libras a kg y visceversa
peso_lb<-c(145,170,190,155,160)
n<-length(peso_lb);n
sum(peso_lb)/n
media_pesolb<-mean(peso_lb);media_pesolb
var(peso_lb)
############################################
peso_kg<-round(peso_lb/k,2);peso_kg

alt_m<-c(1.45,1.70,1.90,1.55,1.60);alt_m

nombres<-c("María","Pedro","Roberto","Lilian","José");nombres
class(nombres)

sexo<-c("F","M","M","F","M");sexo
sexo1<-as.factor(sexo);sexo1
class(sexo1)

lista<-data.frame(nombres,sexo1,peso_lb,alt_m);lista
class(lista)

mean(lista$alt_m)

attach(lista)
mean(alt_m)
median(alt_m)
var(alt_m)
sqrt(var(alt_m))
detach(lista)

mean(alt_m)
