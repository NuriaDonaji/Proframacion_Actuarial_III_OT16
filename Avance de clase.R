# Clase de 24/08/2016

x <- 1
print(x)
# Impresi�n forzada
x
#Imresi�n autom�tica

#Clase de 25/08/2016

#crear Vectores con la funci�n vector
x <- vector(mode = "numeric", length = 5)
x

#crear vectores con funci�n
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
unclass(x) #lo cambia a num�rico
x <- factor(c("si","no", "si","si","no","si","no"), levels = c("si","no")) #cambiar el oreden de los niveles
x
unclass(x)

x <- factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)

#Valores faltantes
x <- c(1,2,NA,10,3)
is.na(x) #Valor faltante
is.nan(x) #Valor no num�rico

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
data <-read.table("table.csv",T,",")#con t�tulos
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
data <-read.table("table.csv",T,",",colClasses = clases) #en el momento de leerlo ser� m�s r�pido, le asigno el tipo de clase por columna

#uso de dput y dget
y <- data.frame(a =1,b="a")
y
dput(y)
dput(y, file= "Y.R")
nueva.y <- dget("Y.R")
y
nueva.y


x <- "Programaci�n Actuarial III"
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
#tambi�n podemso extraer una secuencia de elementos
x[1:4]
#Es posible extraer los elemntos que cumplen una restriccion
x[x>"b"]
#De manera equivalente se puede obtener un vector l�gico
u <- x =="c"
u #es de tipo l�gico
x[u] #me regresa solo los valores que cumlen la condicion

#Creamos una lista
x<- list(foo = 1:4, bar =0.6)
#Extraemos el primer elemento de la lista, este elemento es una lista que contiene una secuencia
x[1]

#Extraemos nuevamente el primer elemento de la lista, ahora el elemnto es la secuencia en s�
x[[1]]
#extraemos un elemento por nombre
x$bar # paraeso el $
x[["bar"]]
x["bar"]

x[2]


