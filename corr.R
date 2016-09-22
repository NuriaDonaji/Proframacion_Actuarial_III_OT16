corr <- function(directorio,horizonte = 0)
  cor()

mediacontaminante <- function(directorio,contaminante = sulfate/nitrate,id = 1:332)
{setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
  tabla <- vector("numeric")
  for (i in id){
    
    tabla <- read.csv(paste(directorio,"/",formatC(i,width = 3, flag= "0"),".csv", sep = ""))
    
    completos <- complete.cases(tabla)
    t <- tabla[completos,]
    tt <- rbind(t[completos,])
  }
  if (contaminante== "sulfate"){
    media <- mean(t[,2]) 
  }else if(contaminante==nitrate)
  {media <- mean(tt[,3])} 
  media}

mediacontaminante("specdata","sulfate",1:2)