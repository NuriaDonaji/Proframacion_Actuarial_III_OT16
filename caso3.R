setwd("~/GitHub/Programacion_Actuarial_III_OT16/UCI HAR Dataset/")

#se cargan los datos
features<- read.table(paste("features.txt",sep = "/"),quote ="\"")
activities_labels<- read.table(paste("activity_labels.txt",sep = "/"),quote ="\"")

train <-read.table(paste("train/X_train.txt", sep="/"),quote= "\"")
subject_train<-read.table(paste("train/subject_train.txt", sep="/"),quote= "\"")
y_train<-read.table(paste("train/y_train.txt", sep="/"),quote= "\"")

test <-read.table(paste("test/X_test.txt", sep="/"),quote= "\"")
subject_test<-read.table(paste("test/subject_test.txt", sep="/"),quote= "\"")
y_test<-read.table(paste("test/y_test.txt", sep="/"),quote= "\"")

#juntamos los datos de train con test
data <- rbind(train,test)
volunteers <- rbind(subject_train,subject_test)
actividades <- rbind(y_train,y_test)

#seleccionamos los valores que tengan media o desviacion estandar

nombres <- features[,2] #seleccionamos la columna 2 de features
colnames(data) <- nombres #nombre a las columnas de data 
a <- grep('-(mean|std)',features[,2]) #vector que contiene las posiciones de las
#columnas que tienen en el nombre std o mean

stdmean <- nombres[a] #extrae las coincidencias 
data1<- data[,a] #hace una nueva tabla con las coincidencias
#encontramos 79 columnas que tienen promedio o desviación estándar

#Usa nombres de actividad para describir los nombres de las actividades en la base de datos.  

ac <-as.vector(activities_labels[,2]) #seleccionamos los nombres de las actividades
#y las convertimos en un vector
ad <-ac[actividades[,1]] # en la columna de números aparecen ahora las actividades
ap <-as.data.frame(ad) #como sale un vector de caracteres lo tranformamos a un data.frame


#Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan.
colnames(data1) <- sub("mean", "Mean", colnames(data1))
colnames(data1) <- sub("t", "Time", colnames(data1))
colnames(data1) <- sub("sTimed", "Std", colnames(data1))
colnames(data1) <- sub("f", "Frequency", colnames(data1))
colnames(data1) <- sub("meanFreq", "MeanFreq", colnames(data1))
colnames(data1) <- sub("()-X", "(X)", colnames(data1))
colnames(data1) <- sub("()-Y", "(Y)", colnames(data1))
colnames(data1) <- sub("()-Z", "(Z)", colnames(data1))
colnames(data1) <- sub("-", ".", colnames(data1))




#Con los datos del paso 4, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto

datafinal <- mutate(data1,Volunteers = volunteers[,1],Activity = ap[,1])
finalahorasí <- order(datafinal$Volunteers)
s <-datafinal[finalahorasí,]
s
















