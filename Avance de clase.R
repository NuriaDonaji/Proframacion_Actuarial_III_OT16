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
data <-read.table("table.csv",T,",")
data
data <-read.table("table.csv",F,",")
data
