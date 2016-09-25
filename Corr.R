corr <- function(directorio,horizonte){
 
 datos1<- vector("numeric")
 complet<- vector("numeric")
   completos <- function(directorio,id = 1:332)
  {setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
    datos <- vector("numeric")
    tabla <- vector("numeric")
    for (i in id){
      
      tabla <- read.csv(paste(directorio,"/",formatC(i,width = 3, flag= "0"),".csv", sep = ""))
      
      completos <- complete.cases(tabla)
      t <- tabla[completos,]
      s <- nrow(t)
      datos <- c(datos,s)
    }
    tabla2 <- data.frame(Id = id,nobs= datos)
    tabla2
  }
   
   u <- completos("specdata",1:332)
   v <- u[u["nobs"]>horizonte,]
    iid <- v[["Id"]]
  tabla3<- vector("numeric")
  for (i in iid) {
  tabla3 <- read.csv(paste(directorio,"/",formatC(i,width = 3, flag= "0"),".csv", sep = ""))
  
  r <-complete.cases(tabla3)
  s <- tabla3[r,]
  
  co <- cor(s[,2],s[,3])
  datos1 <- c(datos1,co)
  
  
}

datos1
}
corr("specdata", 150)






