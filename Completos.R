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
  tabla2 <- data.frame("id nobs"= datos)
  tabla2
}

completos("specdata",1:2)