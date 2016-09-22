corr <- function(directorio,horizonte = 0)
{setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
  tabla <- vector("numeric")
  for (i in 1:332){
    
    tabla <- read.csv(paste(directorio,"/",formatC(i,width = 3, flag= "0"),".csv", sep = ""))
    
    completos <- complete.cases(tabla)
    t <- tabla[completos,]
    
  }}
  

corr("specdata",0)