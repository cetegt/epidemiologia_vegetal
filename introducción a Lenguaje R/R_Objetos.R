
# Epidemiología vegetal
# Dr. Ezequiel López
# Dr. Byron González
# http://cete.fausac.gt

# Creando OBJETOS en R

##################################################################################################

#a) NÚMERO

# Para asignar el nombre a un objeto, puede usar "<-", "=" o "->", vea los siguientes ejemplos:
a <- 2      #a recibe 2, otra forma de nombrar el objeto sería: a =2 o 2->a
x <- 5      #x recibe 5

#Verificar el valor de cada objeto

a    # luego Enter
x    # luego Enter
n<-500
NC<-round(1+3.332*log10(n),0);NC  #Ecuación de Sturges para calcular el número de clases

# Operaciones con los objetos

a+x #suma
a-x #resta
a*x #producto
a/x #división
a^x #potenciación

#El resultado de una operación, a su vez, puede ser guardado en un 3er objeto

c1<-2*a + 300/x;c1

## Para separar expresiones se emplea el punto y coma (;)

j<-"uso"; k<-"del comando"; l<-"list()"	# usando o ";" nuevamente
j;k;l				# mostrando los objetos "j", "k" e "l"
ls()				# lista todos los objetos existentes en la memoria
obj<-ls()				# almacena la lista de objetos
obj				# muestra la lista guardada en el objeto "obj"

########################

## Operadores comparativos

# Los operadores comparativos o de relación interaccionan sobre cualquier tipo de elemento devolviendo uno
# o varios valores lógicos. Siempre necesitan dos elementos (a < b) para poder actuar.
#Ejemplos:

x1<-10      # Asignamos a x1 el valor 10
x1<5         # Le preguntamos si x1 es menor que 5
x1>=5      # Le preguntamos si x1 es mayor o igual que 5
x1==5      # Le preguntamos si x1 vale 5
x1!=5         # Le preguntamos si x es distinto de 5

#####################################################################################################

#b) VECTOR

#En R, Vector es cualquier conjunto unidimensional de valores.
#Tipos de valores: números, string (palabras) o valores lógicos (F para falso y T para verdadero) 
#El concepto de vector, en R, tiene un significado más amplio que para Matemática.

#Para atribuir un conjunto de valores a un objeto, puede usarse el comando c(), con los valores
#separados por comas, dentro de los paréntesis.

d<-c(5,8,12,3.5,9,1)  #d recibe un vector

d #para verificar los valores que están en el vector d

d[4]   #valor que está en la 4a posición del vector d

length(d)
t2<-c(4,16,25)

sqrt(t2)

#Otra forma de nombrar un vertor es usando la función assign()

assign("b", c(10.4, 5.6, 3.1, 6.4, 21.7))


## Otros ejemplos de vectores

aves<-c(22,28,37,34,13,24,39,5,33,32) # c significa "concatenar" (colocar junto)

aves # número obervado de aves por especie.

# Para acceder a más de un valor use c para concatenar dentro de los corchetes [c(1,3,...)]:

aves[c(5,8,10)] # accede al quinto, octavo y décimo valores

# Para excluir un valor, ejemplo: el primeiro, use:

aves[-1] # note que el valor 22, el primero del objeto aves, fue excluído



aves[1]<-22 # El primer valor de aves deve ser 22, se restituye el valor.


#La función length da el número de observaciones (n) dentro del objeto.

length(aves)

# Objetos vectores con caracteres (letras, variables categóricas). 

letras<-c("a","b","c","da","edw")

letras

palabras<-c("Guatemala","Escuintla","Cobán","Coatepeque")

palabras


# Todo objeto tiene dos atributos intrínsecos: tipo y longitud.
# El tipo se refiere a la clase básica de los elementos en el objeto; existen cuatro tipos principales: 
# a) numérico, b) caracter, c) complejo y d) lógico (FALSE [Falso] or TRUE [Verdadero])

mode(palabras) #tipo de objeto
length(palabras) #longitud

## Operaciones con vectores

# Podemos hacer diversas operaciones usando el objeto aves, creado anteriormente.

max(aves)       		#valor máximo contenido en el objeto aves
min(aves)       		#valor mínimo
sum(aves)      		#Suma de los valores de aves

aves^2          		#eleva al cuadrado cada valor del vector
n.aves<-length(aves)                    	# número de observaciones (n)
media.aves<-sum(aves)/n.aves     	# media aritmética
mean(aves)
median(aves)
sd(aves)
var(aves)

# mean es la función de R para calcular la media aritmética

###################################################################################


##Transformar datos
#En algunos casos es necesario o recomendable, que Ud. transforme sus datos antes de hacer sus análisis. 
#Transformaciones comunmente utilizadas son log y raíz cuadrada.

sqrt(aves)       #Raíz cuadrada de los valores de aves
log10(aves)    #log(aves) base 10,  
log(aves)        #logaritmo natural de aves

#Para salvar los datos transformados de un nombre al resultado. Por exemplo:

aves.log<-log10(aves) # salva un objeto con los valores de aves en log



#####################################################################################
# Operadores comparativos

# Creamos dos vectores
y1<-1:3; z1<-3:1

# Le preguntamos si son iguales
identical(y1,z1)

# Vemos los elementos que coinciden
y1==z1

# Renombramos x1 e y1
x1<-1:5
y1<-c(2,4,3,6,5)
x1==y1
x1!=y1
x1[x1==y1]
x1[x1!=y1]

c(13, 4, 9, -7, 18) > 7


########################################################################################################################

## FACTOR

## Los factores son vectores en que los elementos pertenecen a una o más categorías temáticas.
## Es un vector que representa datos categóricos.
## Por ejemplo, en una muestra hay hombres y mujeres, un vector conteniendo las categorías:
##Masculino (M) y Femenino (F) es representado en R como un factor.

# Ejemplo 1

d_1<-factor(c("M","M","M","F","F","F"))	                  #fator
d_1					#muestra d_1
e_1<-gl(n=2,k=3,labels=c("M","F"))	                  #crea un fator, gl = generador de niveles (levels)
e_1					#muestra e_1
atributes(e_1)				#atributos de e_1
levels(e_1)				                  #muestra los niveles del factor e_1

## Ejemplo 2

#Suponga que dispone de una muestra de 30 personas de Australia de tal modo que su
#estado o territorio se especifica mediante un vector de caracteres con las abreviaturas
#de los mismos:

estado <- c("tas","sa","qld","nsw","nsw","nt", "wa", "wa",
            "qld","vic","nsw","vic","qld","qld","sa","tas",
            "sa","nt","wa","vic","qld","nsw", "nsw", "wa",
            "sa","act","nsw","vic","vic","act")

## act = Australian Capital Territory, tas= Tasmania, sa= South Australia, qld= Queensland, nsw= New South Wales, vic=Victoria,
## wa = Western Australia, nt = Northern Territory.

FactorEstado <- factor(estado)
levels(FactorEstado)
class(FactorEstado)

ingresos <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
              61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
              59, 46, 58, 43)

#Para calcular la media muestral para cada estado podemos usar la función tapply():

MediaIngresos <- tapply(ingresos, FactorEstado, mean)
MediaIngresos

#Devuelve el vector de medias con las componentes etiquetadas con los niveles:

## Otro ejemplo:

g<-c(1,1,2,2,3,3)			#crea um vetor
gfac<-as.factor(g)			#transforma g en factor
gfac				#muestra gfac
gfac[3:5]				#del tercero al quinto elemento de gfac

######################################################################################################################

# c) MATRIZ

#Una matriz es atribuida a un objeto por la función matrix ().
# Esa función tiene como argumentos: el conjunto de datos, el número de filas y el número de columnas

es<-matrix(c(5,8,12,3.5,9,1),2,3) #e recibe una matriz

es

#En las matrices también es posible referenciar una fila, una columna o un elemento. Por ejemplo:

es[2,]  #fila 2 de la matriz e

es[,3]  #columna 3 de la matriz e

es[1,3] #elemento de la fila 1, columna 3

# Otro ejemplo

m1 <- matrix(1:12, ncol = 3)
m1
length(m1)
dim(m1)
nrow(m1)
ncol(m1)

m1[1, 2]

m1[2, 2]
m1[, 2]

m1[3, ]

m1[1:2, 2:3]


margin.table(m1, margin = 1)

apply(m1, 1, sum)

rowSums(m1)

margin.table(m1, margin = 2)

apply(m1, 2, sum)
colSums(m1)


m2<-matrix(1:12, ncol = 3, byrow = T)
m2

xa<-matrix(10:1,ncol=2)			#creando uma matriz cualquiera
xa					#mostrando x
yb<-cbind(xa,1:5)				#agregando una 3ª columna
yb					#mostrando yb
yb<-rbind(yb,c(99,99,99))			#agregando una nueva fila
yb					#mostrando yb
zc<-cbind(yb,rep(88,6),yb)			 #creando zc
zc

########################################################################################################################################

a_1=matrix(1:12, ncol=4) 
a_11=matrix(1:12,ncol=4,byrow=T)
summary(a_1) # retorna un resumen de estadísticas por columnas

## Si desea un resumen de todos los elementos de la matriz, basta con transformarla en un vector antes de usar el comando summary()

summary(as.vector(a_1))

# Índices de las matrices

a_1[2,3]					#elemento de la fila 2 y columna 5
a_1[,4]					#extrayendo la cuarta columna
a_1[3,]					#extrayendo la tercera fila
a_1[c(1,2),]				#extrayendo las filas 1 y 2
a_1[,2:4]				#extrayendo las columnas de 2 a 4
a_1[c(2,3),c(1,2)]			                #tomando una submatriz 2x2
a_1[3,a_1[3,]>5]				#valores de la fila 3 mayores que 5

which(a_1>8,arr.ind=T)			#cuáles elementos son mayores que 8. El argumento arr.ind, cuando es definido como TRUE, hace que el comando
#which( ) retorne las coordenadas (en este caso, matriciales) de los elementos que atienden al criterio definido.
which(a_1>8)                                                                     #retorna los valores.

##########################################################################################################################################

# d) ARRAY

# Ese término en inglés no posee traducción adecuada

# representa una hipermatriz, o sea, un conjunto de números organizados en más de 2 dimensiones.

# Cuando se tienen 3 dimensiones, un array puede ser entendido como un conjunto de matrizes de 
# la misma dimensión.

# El comando usado es array().

f<-array(0,c(2,2,2)) #array de zeros, con 2 filas, 2 columnas y 2 matrices (de 2 x 2 com ceros) 

f[,,1]<-matrix(c(1,2,3,4),2,2) #primeira matriz
f[,,2]<-matrix(c(5,6,7,8),2,2) #segunda matriz

f

# O con la alternativa:

f<-array(c(1,2,3,4,5,6,7,8),c(2,2,2)) #de una sola vez


##De forma análoga, se puede preguntar cuál es el valor que ocupa la primera fila, de la segunda
##columna, de la segunda matriz, del objeto f.

f[1,2,2]

######################################################################################################################


##e) DATA FRAME

# Es una estrutura de datos como especie de tabla, de estructura bidimensional de
# datos. Pueden formar parte de un mismo data frame números y strings. Además, pueden
# ser dados nombres a las columnas. Su función es data.frame(). Vea el ejemplo:


g<-data.frame("Marca"=c("Wolks","Fiat","Ford"),"Precio"=c(32000,28000,29500))

g

# Creando un DATA FRAME

tr <- gl(2,5)
rp <- c(1:5,1:5)
peso <- c(25.5, 28.4, 24.1, 27.5, 26.3, 31.6, 30.5, 29.3, 31.1, 29.4)
df <- data.frame(tr,rp,peso); df
mode(df)
class(df)


# Más sobre DATAFRAME

#Objeto parecido con la estructura de MATRIZ, pero permite columnas de diferentes tipos en un mismo objeto

# Ejemplo

Nombre<-c("José Santos",		#creando el vector Nombre
          "Angela Díaz",
          "Adriana Sosa",
          "Mayra Costa",
          "Laura López",
          "Nícolás Barrios")

Nombre				#muestra Nombre
Edad<-c(17,17,16,15,15,13)		#creando el vector Edad
Edad				#muestra Edad
Sexo<-factor(c("M","F","F","F","F","M"))         #factor
Sexo				#muestra Sexo
NF<-c(92,75,81,87,90,88)		#vector NF (Nota Final)
NF				#muestra NF

escuela<-data.frame(Nombre,Edad,Sexo,NF)	#creando escuela
escuela				#mostrando el objeto

atributes(escuela)			#muestra los atributos

row.names(escuela)<-c("linea 1",	                   #nombre de las líneas
                      "linea 2",
                      "linea 3",
                      "linea 4",
                      "linea 5",
                      "linea 6")
escuela				#muestra escuela
names(escuela)			#nombres de las columnas de escuela

# Índices de los Data.frames

escuela[2,1]			#elemento de la fila 2, columna 1
escuela[2,]				#toda la fila 2
escuela[,1]				#vea que es factor
escuela[,1]<-as.character(escuela[,1])	#convierte a caracter
escuela[,1]				#ahora es caracter

escuela$Nombre			#accesando a la columna Nombre
escuela$Nombre[2]			#segundo objeto de la columna Nombre
escuela$Nombre[1:3]			#tres primeros elementos de Nombre


# Manipulando um Data.frame

escuela<-cbind(escuela,		#adicionando una columna
               Categoria=c("A","C","B","B","A","B"))

escuela				#vea la columna Categoría

escuela<-rbind(escuela,	 "linea 7"=c("Carlos Antonio",12,"M",99,"A")) #adicionando una fila

escuela				#mostrando escuela

escuela<-escuela[1:6,]			#selecciona las líneas de 1 a la 6
escuela<-escuela[,-5]			#excluyendo la quinta columna
escuela				#mostrando escuela

# Separando un Data.frame por Grupos

split(escuela,			#objeto a ser separado
      Sexo)				#nombre de la columna deseada

escuela[escuela$Sexo=="M",]		#mostrando solo masculinos
escuela[order(escuela$NF),]		#ordena por NF
escuela[rev(order(escuela$NF)),]		#ordena de manera inversa

#######################################################################################################################

##f) LISTA

# Una lista es un conjunto de objetos de tamaños y naturalezas diferentes. Ella es regida por la função list().

h<-list(3,matrix(c(1,2,3,4),2,2),"lista",c(5,6,7,8))

## Suponga que desee saber cuál es el tercer elemento del vector que está localizado en la 
## posición cuarta de la lista h.

h[[4]][3]

##########################################################################################################################

# Durante una sesión de trabajo con R los objetos que se crean se almacenan por nombre, para saber que
# objetos hemos creado (almacenado), digitamos:

objects () #o bien,
ls()

# La colección de objetos almacenados en cada momento se denomina espacio de trabajo (workspace)

## Atributos de los objetos

#Todo objeto posee atributos intrínsecos: tipo y tamaño. 
#Con relación al tipo puede ser: numérico, caracterer, complejo y lógico. 
#Existen otros tipos, como por ejemplo, funciones o expresiones, sin embargo no representan datos.

###############################################################################

# Para eliminar los objetos puede utilizar la orden rm, por ejemplo,

rm(a,x)  # o

remove(a,x)

#Para remover TODOS los objetos en su área de trabajo digite:

remove(list=ls()) #elimina TODO!!!!!!

#OBS.: Tome cuidado al usar esta función, pues una vez excluído, el objeto se torna
#irrecuperable. Además, el comando supracitado para remoción de todos los objetos
#no exhibe un mensaje de confirmación de exclusión!

#############################################################################################################################

