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
  
  #CLASE 26/09/2016
  #¿como saber que valor asignar a que simbolo?
  #¿cómo saber si lm (regresion lineal) o lm (la funcion que acabamos de inventar)
  lm #esta guardada en stats
  lm <- function(x){x*x} #reescribo la funcion, se guarda en global environment
  lm
  rm(lm) #remove, remueve la funcion
  lm #vuelve a retomar su valor
  search() #muestra los 10 entornos
  library(stats) #cambia de orden de los paquetes
  search()
  
  #AMBITO ESTATICO (LEXICOLÓGICO)/DINÁMICO
    
 #funcion que crea funciones 
  
  f <- function(x,y)
  {x^2 + y/z}
  #z será un elemento en papá ambiente
  
  hacer.potencia <- function(n){
    
    potencia <- function(x){
 
     x^n
    }
    potencia
  }
  
cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)

cubica (3)
cuadrada(3)
  
 # Entorno de una funcion
ls(environment(cubica))
get("n",environment(cubica))

ls(environment(cuadrada))
get("n",environment(cuadrada))

# en vba 10, en r 34
y <- 10
f <- function(x){
  y <- 2
  y^2 + g(x)
}
g <- function(x){
  x*y
  
}


#prueba de tabulacion
  #Tabulacion 2
    #Tabulacion 4
        #Tabulacion 8

#tamaño de las funciones
  #limitar a una sola actividad
    # leer datos,separarlos, procesarlos, generar un reporte.


#Fechas
x <- as.Date("1970-01-01")
x
class(x)
unclass(x)
unclass(as.Date("1970-01-02")) #me da 1 porque solo ha pasado un día

h <- as.Date("1997-03-24")
h
unclass(h)
unclass(as.date("2016-09-25"))


x
as.POSIXct(x)
as.POSIXlt(x)
ls(as.POSIXlt(x)
ls(as.POSIXct(x))
#CLASE 28/09/16_________________________________________________________________
#LAPPLY
lapply #lista -> lista
# if (!(no)is.vector(X) ||(peor sí) is.object(X)) 
#as. algo es coercionar
#.Internal(lo resulve en c para ser mas rapido y luego lo manda otra vez a r )
?match.fun
?rnorm
x <- list(a=1:5,b=rnorm(10000))
lapply(x,mean) #muy cercano a cero

x <- list(a=1:5,b=rnorm(10),c=rnorm(10,1),d=rnorm(10,2))
lapply(x,mean)

x <- 1:4 #cantidad de numeros aleatorios a generar
lapply(x,runif)
?runif

x <- 1:4
lapply(x, runif, max=15, min=5) 


#SAPPLY
sapply
x <- list(a=1:5,b=rnorm(10),c=rnorm(10,1),d=rnorm(10,2))
sapply(x,mean)#me devuelve un vector

x <- 1:4 #cantidad de numeros aleatorios a generar
sapply(x,runif) #como el valor de cada elementos es diferente, te enseña lo mismo que lapply

x <- 1:4
sapply(x, runif, max=15, min=5) 
#como el valor de cada elementos es diferente, te enseña lo mismo que lapply



x <- matrix(rnorm(200),20,10)
apply(x,2,mean)
apply(x,1,sum)

#Para sumas y medias de dimensiones de una matriz (medias y sumas de filas/columnas)

rowSums = apply(x,1,sum)

rowMeans =apply(x,2,mean)
colSums =apply(x,1,sum)
colMeans =apply(x,2,mean)

x <- matrix(rnorm(200),20,10)
apply(x,1,quantile,probs = c(0.25,0.75)) #El 1 indica a las veinte filas
?quantile
#el porcentaje d enumeros qu estan por abajo del numero


a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)

rowMeans(a,dims=2) #Es para más dimensiones p/e 4

#MAPPLY -> multivariable,aplica una funcion en paralelo a lo largo de un conjunto
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep,1:4,4:1))
#vectorizar una funcion
noise <- function(n,mean,sd){
    rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)

mapply(noise(1:5,1:5,2)) #genera n numeros con media n

#TAPPLY -> Table,
x <- c(rnorm(10),runif(10),rnorm(10,1))

f<- gl(3,10)
f
tapply(x,f,mean)

tapply(x,f,mean,simplify=F)

#CLASE 29/09/2016
?split
str(split)
#x es un vector,lista o data frame
#f es un factor o lista de factores
#drop indica si los factores vacíos deberían de omitirse


x <- c(rnorm(10),runif(10),rexp(10))
f <- gl(3,10)
f
split(x,f)

lapply(split(x,f),mean)

library(datasets)
head(airquality)
#Ejercicio separar por mes(factor)
d <- airquality$Month
split(airquality,d)
#otra forma
split(airquality,airquality[["Month"]])
#Más ejemplos
s <- split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,1:3],na.rm = T))
 
sapply(s,function(x) colMeans(x[,1:4],na.rm = T)) #queda un data frame

#split a mas de un nivel
x<- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1
f2
interaction(f1,f2)
x
str(split(x,list(f1,f2)))

#CLASE 03/10/16________________________________________________________________

#MANEJO DE ERRORES
#Indicadores de que algo está mal:
    #message
    #warning
    #error
    #condition

imprim<- function(x){
     if(x>0)
        print("x es mayor que 0")
    else 
        print("x es menor que 0")
}
imprim(NA)

imprimemsj<- function(x){
    if(is.na(x))
        print("x es un valor faltante")
    else if(x>0)
        print("x es mayor que 0")
    else 
        print("x es menor que 0")
}

imprimemsj(NA)
log(-1)
 
#TRACEBACK
 rm(x)
 mean(x)
 traceback()
 
 lm(y~x)
 traceback() #el error aparece en la linea 7

#DEBUG
 
debug(lm)
lm(y~x) #presionamos n(ext)hasta que nos aparezca el error

#CAMBIAR CONFIGURACION DE ERRORES
options(error = recover)
read.csv("perritosgay")
#te desglosa un menú de opciones para revisión


#TAREA : hacer hasta la seccion 61

#CLASE 05/10/16_________________________________________________________________

str(str)
str(lm)
str(ls)
x <- rnorm(100)
str(x)
summary(x)
f <- gl(40,10) #lista de factores rep cada uno 10 veces
 f   
str(f)
summary(f) #cuales hay y cuantos de cada uno, mas para estadistica
str(airquality)

m <- matrix(rnorm(100),10,10)
m
str(m) #me muestra los primeros 10 elementos
s <- split(airquality,airquality$Month)
s
str(s) #me dice como esta compuesto s, son 31 por los dias de los meses

#GENERAR NÚMEROS ALEATORIOS
 #rnorm  r genera una variable aleatoria/genera variables normales aleatorias con media y desviacion estandar dadas
 #dnorm  d densidad/la probabilidad de que tu variable aleatoria salga p/e dado 2 es 1/6
 #pnorm  p para la distribuicion /evalua l funcion de distribucion en un punto de una distribucion normal
 #rpois genera variables aleatorias poisson con tasa dada, modelar ,numero de eventos en un intervalo de tiempo o espacio

x <- rnorm(10)
x
y <- rnorm(10,50,5)
y
 summary(x)
 summary(y)
 
#Semilla para que la gente pueda replicarlo y saber que numeros aleatorios usé 
set.seed(1)
rnorm(5)

set.seed(2)
rnorm(5)

set.seed(1)
rnorm(5)

normal1 <- rnorm(10000)
normal2 <- rnorm(10000,10,5)

hist(normal1) #grafica un histrograma de frecuencias de los valores,
#me voy del max al min y los separo en intervalos(16)
summary(normal1)# para ver el rango en el que se enuentran los valores, promedio cerca del cero

hist(normal2) #se encuentran mas valores cerca de la media cosa que es normal
summary(normal2)
rpois(10,1)
poisson1 <-rpois(10000,1)
poisson2 <-rpois(10000,10)
hist(poisson1) #hay espacios porque son enteros, más cerca al 1
hist(poisson2) #más cerca al 10
ppois(2,2)
ppois(4,2)
ppois(6,2)
hist(rpois(10000,2))

for (i in 0:11){
    print(dpois(i,2))
}

hist(runif(10000,10,20)) #uniforme con min 10 max 20

#GENERAR NÚMEROS ALEATORIOS DESDE UN MODELO LINEAL
set.seed(20)
x <- rnorm(100,0,1)
e <- rnorm(100,0,2)
y <- 0.5+ 2*x + e #r trbaja de forma vectorial entonces puedo sumarlo sin necesidad de un ciclo
y
summary(y)
plot(x,y)
z <- 0.5 + 2*x # no hay error
plot(x,z) #una perfecta correlacion a pesar de ser variables aleatorias
plot(z,y) #tienen relacion, solo las diferencia el error e

#CLASE 06/10/16_________________________________________________________________

set.seed(10)
x<- rbinom(100,1,0.5)#numero de exitos en n intentos(n,size,prob)
e <-rnorm(100,0,2)
y <- 0.5+2*x + e
summary(y)
plot(x,y,main="Modelo Lineal",col="dark red")#o tienes exito o no

#simular un modelo Poissson
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y<- rpois(100,exp(log.mu))
summary(y)
plot(x,y,main = "Modelo Poisson", col="forestgreen")

#CLASE 10/10/16_________________________________________________________________

#MUESTREO
set.seed(1)
sample(1:10,4)
sample(1:10,4)
sample(letters,5)
sample(1:10)
sample(1:10)
sample(1:10,replace = TRUE)

#PERFILAJE :optimización del código

#system.time()
    #usertime : tiempo que ocupo la expresion en el CPU
    #elapsedtime: tiempo de reloj
system.time(readLines("http://www.fcfm.buap.mx"))

hilbert <- function(n){
    i<- 1:n
    1/outer(i-1,i,"+")
}
x <-hilbert(1000) #investigar que es
system.time(x<-hilbert(1000))
system.time(svd(x))
?svd


#Rprof() perfilador, cada .02 seg,no juntar con system.time, summaryRprof()resume la salida de Rprof()


#CLASE 20/10/2016_______________________________________________________________

#LIMPIEZA Y DEPURACIÓN DE DATOS
    #Api <- interaccion entre software
    #Json <- JavaScript
#Diseño experimental es una técnica estadística que permite identificar y 
#cuantificar las causas de un efecto dentro de un estudio experimental.
#Explicar cómo se recaudó la información.

#CLASE 24/10/2016_______________________________________________________________
getwd()
tail(list.files(),2)
setwd("./testdir")
getwd()
tail(list.files(),2)
setwd("../")
getwd()
setwd("../")
getwd()
?file.exists
?dir.create

if ((file.exists("data"))==FALSE){dir.create("data")} else {print("Ya existe")}
#if (!file.exists("data")){dir.create("data")}

#CREAR UNA CARPETA PARA GUARDAR LOS DATOS DESCARGADOS
if ((file.exists("data"))==FALSE){dir.create("data")} else {print("Ya existe")}
#if (!file.exists("data")){dir.create("data")}
if (!file.exists("data")){dir.create("data")}

#DESCARGAR DATOS DE INTERNET
?download.file
if (!file.exists("data")){dir.create("data")}
url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(url,destfile = "./data/camaras.csv")
list.files("./data")

#REGISTRA LA FECHA
fechaDescarga <- date() 
fechaDescarga

#CARGAR LOS DATOS DESDE MI COMPUTADORA
dataCam <- read.table("./data/camaras.csv",header = TRUE,sep = ",",fill=TRUE)
head(dataCam)
dataCam <- read.csv("./data/camaras.csv")
#quote
#na.strings Not Available en el caso 2 de los hospitales
#skip

#EXCEL
if (!file.exists("data")){dir.create("data")}
url <- ""
download.file(url,destfile = "./data/camaras1.xlsx")
dataCam2 <- read.csv("./data/camaras1.xlsx")
fechaDescarga2 <- date()
#install.packages("rJava") #puede causar error ente 32 y 64
#install.packages("xlsx")
library("rJava");library("xlsx")
DatosCamara <- read.xlsx2("",sheetIndex=1,header= TRUE)
head(DatosCamara)


#CLASE 26/10/2016_______________________________________________________________
DatosCamara <- read.xlsx2("",sheetIndex=1,header= TRUE)
head(DatosCamara)

url <- "http://www.w3schools.com/xml/simple.xml"
data <- xmlTreeParse(url,useInternalNodes = TRUE)
nodoRaiz <- xmlRoot(data)
xmlName(nodoRaiz)
names(nodoRaiz)
nodoRaiz[[1]]
nodoRaiz[[1]][[1]]

xmlSApply(nodoRaiz,xmlValue) #sapply aplicado a xml y me regresa su valor
#http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf
xpathSApply(nodoRaiz, "//name", xmlValue)
xpathSApply(nodoRaiz, "//price", xmlValue)

#JSON

install.packages("jsonlite")
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/NuriaDonaji/repos")
names(jsonData)
jsonData$name

myjson <- toJSON(iris,pretty = TRUE)
cat(myjson)

iris2<- fromJSON(myjson)
head(iris2)
#www.json.org

#turorial de JSONlite
#JSON vignette

#CLASE 27/10/2016_______________________________________________________________

#data.table
library(data.table)
DF <- data.frame(x = rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DT <- data.table(x = rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DT[2,]
DT[DT$y == "a"]
DT

data.frame(DT)
data.frame(DT[DT$y == "b",])
class(DT)




DT[c(2,3)]
DT[,c(2,3)]

#Subconjunto de columnas
k <- {print(10);5}
print(k)

#Calcular valores para variables con expresiones
DT[,list(mean(x),sum(z))]
DT[,table(y)]

DT[,w:=z^2]
DT

DT <- data.table(x = rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
DT2 <- DT
DT[,y:=2]
head(DT)
head(DT2)#lo cambia porque las tablas están diseñadas para trabajar vinculadas

DT[,m:={tmp <-(x+z);log2(tmp+5)}]
DT

DT[,a:=x>0]
DT
DT[,b:=mean(x+w),by=a]
DT

set.seed(123)
DT <- data.table(x=sample(letters[1:3],1E5,TRUE)) #1 elevado a la 5, true porque las va a repetir (como un dado)
DT[,.N,by=x] #Funcion N cuenta cuantas veces apareció


#SWIRL
#tbl_df
#?select
#select(cran,-time/country:r_arch)
#filter(cran,!is.na(r_version))
#arrange(cran2,country,desc(r_version),ip_id)
#mutate(cran3, size_mb = size / 2^20,size_gb =size_mb/ 2^10)
#summarize(cran,avg_bytes = mean(size))
#Comparison
#by_package <- group_by(cran,package)
#summarize(by_package,mean(size))

#CLASE 09/11/2016
#CONTINUACIÓN DATA TABLE
DT <- data.table(x=rep(letters[1:3],each=100),y =rnorm(300))
setkey(DT,x) #mi llave es la variable x
DT['a']

DF = data.frame(x=rnorm(9), y = rep(c("a","b","c"),each=3),z=rnorm(9))

DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);setkey(DT2,x)
merge(DT1,DT2) #herramienta data.table, junta tablas en relacion a las variables

#
set.seed(1)
df_gde <- data.frame(x=rnorm(1E6),y = rnorm(1E6))
file<- tempfile()



write.table(df_gde,file=file,row.names = F,col.names = T,sep="\t",quote=F)
system.time(fread(file))
system.time(read.table(file,header = T,sep="\t"))
?



#mySQL
#query es cuando extraes informacion de internet
install.packages("RMySQL")
ucscDb <- dbConnect(MySQL(),user="genome",host ="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
result

#CLASE 10/11/2016
library(RMySQL)
hg19 <- dbConnect(MySQL(),user="genome",db = "hg19",host ="genome-mysql.cse.ucsc.edu")
tablas <- dbListTables(hg19)
length(tablas)
tablas[1:3]

dbListFields(hg19,"affyU133Plus2")


affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)

query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query);quantile(affyMis$misMatches)

dbDisconnect(hg19)




#CLASE 16/11/2016
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created = h5createFile("example.h5")
created

created = h5createGroup()


A = matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=)

df = data.frame(1L:5L,seq(0,1,length.out = 5),c("ab",))
                
readA = h5read("example.h5","foo/A")
readB = h5read("example.h5","foo/foobaa/B")
readdf = h5read("example.h5","df")
readA

h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))
h5read("example:h5","foo/A")




set.seed(13435)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),var3=(11:15)) #"le pone nombre, el titulo sera var3"
x <- x[sample(1:5),]
x
x$var2[c(1,2)]= NA
x[,1]
x[,"var1"]
x$var2[c(1,2)]
x[1:2,"var2"]



subset(x,x$var1 <=3 & x$var3>11)
x[x$var1<=3 & x$var3>11,]
x[x$var1<=3 | x$var3>11,]
#hacen lo mismo
x$var1<=1 & x$var3>11
x$var1<=1 && x$var3>11




#CLASE 17/11/2016

which(x$var2 > 8)

x[which(x$var2 > 8),]

?sort
sort(x$var1)
sort(x$var1, decreasing = T)

sort(x$var2)
sort(x$var2, decreasing = T)#no considera los na's

#para que los tome en cuenta (NA)
sort(x$var2,na.last = T)
sort(x$var2, decreasing = T,na.last = TRUE)

x[order(x$var1),]

sort(x$var2, na.last = T)
sort(x$var2, decreasing = T,na.last = T)
x[order(x$var2),]

x[order(x$var2, decreasing = T,na.last = F),]
library(plyr)

arrange(x,var1)
arrange(x,desc(var1))

#Agregar una columna nueva
cbind(x,var4=sample(c(16:20)))
x$var4 <- rnorm(5)

#CLASE 24/11/2016

if(!dir.exists("data")){dir.create("data")}
url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accesType=DOWNLOAD"
download.file(url,"./data/restaurantes.csv")
data <- read.csv("./data/restaurantes.csv")
head(data,n=3)
tail(data,n=3)
summary(data)
str(data)

#CLASE 30/11/2016
quantile(data$councilDistrict,na.rm=T)
quantile(data$councilDistrict, probs= c(0.5,0.75,0.9))

table(data$zipCode, useNA="ifany")
table(data$councilDistrict,data$zipCode)