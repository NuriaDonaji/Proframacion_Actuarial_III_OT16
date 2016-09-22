corr <- function(directorio,horizonte)
{setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
  datos <- vector("numeric")
  tabla <- vector("numeric")
  for (i in 1:332){
    
    tabla <- read.csv(paste(directorio,"/",formatC(i,width = 3, flag= "0"),".csv", sep = ""))
    completos <- complete.cases(tabla)
    t <- tabla[completos,]
    s <- nrow(t)
  if (s>=horizonte)
  {co <- cor(t[,2],t[,3])
    datos <- c(datos,co)}
  else{datos = 0}
  }
  com <- complete.cases(datos)
  datos1 <- datos[com]
  datos1
  } 

corr("specdata",0)
 
