# Clase de 24/08/2016

x <- 1
print(x)
# Impresión forzada
x
#Imresión automática

#Clase de 25/08/2016

#crear Vectores con la función vector
x <- vector(mode = "numeric", length = 5)
x

#crear vectores con función
x <- c(0.5, 0.6)
x
class(x)



x <- c(TRUE,FALSE)
x
class(x)

x <- c(T,F,T,F)
x <- 10:0
x
class(x)

#x <-(1+2i,5,3+9i,-4-5i)
x
class(x)

x <- c("a","b","c","d", e)#marca error en la e
x
class(x)

#Mezclar objetos en un vector


#Clase de 29/08/2016
#Matrices
m <-matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)
dim(m) <- c(3,2) #cambio de dimensiones de 2X3 a 3X2
m
#Crear una matriz con datos
m <- matrix(1:6,3,2)
m

m <- matrix(1:6,3,2,T)
m

m <- matrix(1:6,3,3,T)
m
class(m)
str(m)

dim(m) <- c(2,5) #marca error porque faltan elementos

x <- c(1,2,3)
y <- c("a","b","c")
z <- c(x,y) #combinamos los vetores

m1 <- rbind(m,x) #por fila
m1

m2 <- cbind(m,x) #agrega de forma de columna
m2

m1 <- rbind(m,y)
m1

m2 <- cbind(m,y)
m2

rbind(m1,y)
cbind(m1,y)

#clase 31 / 08/16

#Factores
x <- factor(c("si","no", "si","si","no","si","no"))
x
table(x) #cuenta la frecuencia
unclass(x) #lo cambia a numérico
x <- factor(c("si","no", "si","si","no","si","no"), levels = c("si","no")) #cambiar el oreden de los niveles
x
unclass(x)

x <- factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)

#Valores faltantes
x <- c(1,2,NA,10,3)
is.na(x) #Valor faltante
is.nan(x) #Valor no numérico

#Data Frame
x <- data.frame(Erick = 1:4, Lori = c(T,T,F,F))
x
row.names(x) <- c("Primero","Segundo","Tercero","Cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x) <- c("Yarely","Karen")
x

#los nombres no son exclusivos de los data frames
x <- 1:3
names(x) #null
names(x) <- c("Hugo","Paco", "Luis")

x <- list(a= 1:10,b= 100:91,c= 51:60)
x
names(x) <-c("Seq1","seq2","seq3")
x


m <- matrix(1:4, 2,2)
m
attributes(m)
dimnames(m)<- list(c("fill1","fill2"),c("col1","col2"))
m

#crear una matriz con datos vacios fila 5 columna f
#a <- matrix( nrow = 5,ncol= 7)
a <- matrix(NA,5,7)
#dimnames(a) <- list(c("1","2","3","4","5"),c("A","B","C","D","E","F","G"))
dimnames(a) <- list(c(1:5),c("A","B","C","D","E","F","G"))
a

#Lectura de Datos
getwd()
#[1] "C:/Users/Nuria Donaji/Documents"
setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data <-read.csv("table.csv") #version mas general que read.table
data <-read.table("table.csv",T,",")#con títulos
data

#Tarea clase de columna
getwd()

setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data <-read.table("table.csv",T,",")

class(data[,3])
sapply(data,class)

#Clase de una base de datos

setwd("~/GitHub/Programacion_Actuarial_III_OT16")
data <-read.csv("table.csv")

data <-class(data[,3])



#Calse 05/09/16
#AirQuality
?airquality
?apply

data <-read.table("table.csv",T,",")
args(read.table)
data <-read.table("table.csv",T,",",nrows = 100) #se usan las primeras 100 filas y guarda por tipos de clase a las columnas
clases <- sapply(data, class) #creo un vector de resultados de clases
data <-read.table("table.csv",T,",",colClasses = clases) #en el momento de leerlo será más rápido, le asigno el tipo de clase por columna

#uso de dput y dget
y <- data.frame(a =1,b="a")
y
dput(y)
dput(y, file= "Y.R")
nueva.y <- dget("Y.R")
y
nueva.y


x <- "Programación Actuarial III"
y <- data.frame(a=1, b="a")
dump(c("x","y"),file= "data.R") #entre comillas para que me pegue x,no el valor de x
rm(x, y)
source("data.R")
h <- head(airquality)

dump(c("h"),file= "airquality.R") 
rm(h)
source("airquality.R")

#Read lines
con <- url("http://www.fcfm.buap.mx","r") # r de solo lectura
x <- readLines(con,7) #solo las primeras 7
x
#Write Lines
#se necesita guardarlo en un archivo y se guarda en el espacio de trabajo 

#SUBCONJUNTOS_____________________________________________________________________

#Creamos un vector
x <- c("a","b","c","c","d","e")
#veamos el vector
x
#extraemos elementos con []
x[1]
x[2]
#también podemso extraer una secuencia de elementos
x[1:4]
#Es posible extraer los elemntos que cumplen una restriccion
x[x>"b"]
#De manera equivalente se puede obtener un vector lógico
u <- x =="c"
u #es de tipo lógico
x[u] #me regresa solo los valores que cumplen la condicion

#Creamos una lista
x<- list(foo = 1:4, bar =0.6)
#Extraemos el primer elemento de la lista, este elemento es una lista que contiene una secuencia
x[1]

#Extraemos nuevamente el primer elemento de la lista, ahora el elemnto es la secuencia en sí
x[[1]]
#extraemos un elemento por nombre
x$bar # para eso el $
x[["bar"]]
x["bar"]
x$foo[2] #el segundo elemento del primer elemento de la lista
x[2]
#Clase 07/09/16_____________________________________________________________________________________
#Creamos una lista de 3 elementos
x<- list(foo = 1:4, bar =0.6, baz ="Hola")
#Extraemos el primer y tercer elemento de la lista
x[c(1, 3)] #elementos de la lista
x[[c(1, 3)]] #toma el tercer elemento del primer objeto

name <- "foo"
x[[name]] #el doble [[]] me permite resolver el problema
x$name #pero no puedo usar $
x$foo 

x <-  list(a = list(10,12,14), b= list(3.14,2.81))
x[[c(1,3)]] #el tercer elemnto del primer objeto
x[[1]][[3]] #selecciona el primer objeto y luego el tercer elemento con su propia naturaleza
x[[c(2,1)]] #El primer elemento del segundo objeto

#SUBCONJUNTOS DE UNA MATRIZ
x <- matrix(1:6,2,3)
x
x[1,2] #coordenadas, el resultado es un vector
x[2,1]
x[1,] #elementos de la primera fila
x[,2] #elementos de la segunda columna



x[1,2] #el resultado es un vector
#con drop = false, se mantienen la dimension y el resultado será una matriz
x[1,2,drop= FALSE]

#si dejamos solamente el espacio, el resultado será un vector
x[1,]
#si usamos drop =False, el resultado será una matriz
x[1, ,drop =FALSE]


x <- list(aardvark = 1:5)
x$a #encuentra una coincidencia porque el nombre empieza con a 
x[["a"]] #no encuentra nada porque es una busqueda exacta
x[["a",exact=FALSE]] #ahora sí, porque le pedimos que no sea exacto
  #Ejemplo
airquality$O
airquality[["O"]]
airquality[["O",exact=FALSE]]

#VALORES FALTANTES
airquality[1:6,] #el resultado es un data.frame, extrae las primeras 6 filas
completos <- complete.cases(airquality)
completos #es un vector, son 153 elementos que representan el numero de filas de airquality
airquality[completos,]#solo filas completas
airquality[completos,][1:6,] #las primeras 6 filas completas

airquality[1:6,][completos,]# completos tiene 153 filas y l no encontrar valor hay puro NA

#OPERACIONES VECTORIZADAS
x <- 1:4; y<- 6:9
x+y #suma los elementos correspondientes 
# si y = 6:8, sumaría el 4 con el 6 pues repite los valores
x>2
x>=2
y==8 #cuando y = 8
x*y #elementos correspondientes 
x/y #elementos correspondientes 

x <- matrix(1:4,2,2)#byrow= false entonces me lo pone por columnas
y<- matrix(rep(10,4),2,2) #rep me repite un valo cierto umero de veces
x*y
x/y
x %*% y #multiplicacion de matrices, (mxn)*(nxp)= (mxp)

#Clase 08/09/16______________________________________________________________________________________
#ESTRUCTURAS DE CONTROL


#if,else/ for/ while/repeat/break/next/return

x<- c("a","b","c","d")
for(i in 1:4){print(x[i])}

for(i in seq_along(x)){print(x[i])}

for(letra in x){print(letra)}
for(i in 1:4)print(x[i])

#ejercicio
z <- matrix(1:6,2,3,T)
for(i in seq_len(nrow(x)))
  {for(j in seq_len(ncol(x))){print(z[i,j])}}

#CLASE 12/09/16________________________________________________________________________________
z <- 5
while(z>=3 && z<=10)
  {print(z)
  moneda <- rbinom(1,1,0.5)
  if (moneda==1){#Caminata Aleatoria
    z<- z+1
  }else{
    z <- z-1
  }
}
#las condiciones se evaluan de izq a der
#rbinom es variable aleatoria binomial

#Ejercicio hacer un vector que guarde el valor de z

z <- 5
caminata <- vector("numeric")

while(z>=3 && z<=10){
  print(z)
  caminata <- c(caminata,z)
  moneda <- rbinom(1,1,0.5)
  if (moneda==1){#Caminata Aleatoria
    z<- z+1
  }else{
    z <- z-1
  }
}
 #plot(caminata, type = "l")
caminata

#practica de contador (que tanto se sale por abajo o por arriba)
arriba <- 0
abajo <- 0

for (i in 1:100){
  z <- 5
  while(z>=3 && z<=10){
    
    moneda <- rbinom(1,1,0.5)
    if (moneda==1){#Caminata Aleatoria
      z<- z+1
    }else{
      z <- z-1
    }
  }
  if (z<10) {abajo <- (abajo + 1)} else{arriba <- (arriba +1)}
}
arriba
abajo


#CLASE 19/09/2016_____________________________________________________________________________________________
#repeat 
x0 <-1
tol <- 1e-8
repeat{
  x1<-CalculaEstimado(x0)
  if(abs(x1-x0)<tol){
    break
  }else{
    x0<-x1
  }
  
#next para no hacer una iteracion en un ciclo
  for (i in 1:100){
    if (i<=  20){
      next
    }
  }
  
#creaciones de funciones
  suma2 <- function(x,y){
    x+y
  } #la tengo que correr primero para que aparezca en mi enterno
  
mayor10 <- function(x){
  x[x>10]
}  
  
#ejemplos
mayor10(runif(100,5,15))
mayor10(1:100)


mayorque <-function(x,n){
  x[x>n]
}

mayorque(1:10,3)

promedioCol <-function(x,quitar.NA = TRUE){
  nc <- ncol(x)
  medias<- vector("numeric",nc)
  for (i in 1:nc){
    medias[i] <- mean(x[,i], na.rm = quitar.NA) #mean saca media y na.rm quitaa los valores NA del promedio
  }
}
promedioCol(as.matrix(1:10))

#Evaluacion perezosa
f<- function(a,b){
  a^2
}
f(2,1)
f<- function(a,b){
  print(a)
  print(b)
}
f(2) #marca error pues no hay b

#el argumento "..." Para pasar de una funciona otra
myplot <- function(x,y,type="l",...){
  plot(x,y,type=type,...)
}
args(paste)
 #cada que pegue una cadena debera de dejar una separcion de un espacio

args(cat)
 #cada que pegue una cadena no habrá separcion
  
paste("a","b",sep=":")
paste("a","b",se=":")

if
complete.cases()
