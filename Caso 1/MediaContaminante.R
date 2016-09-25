mediacontaminante <- function(directorio,contaminante = sulfate/nitrate,id = 1:332)
{setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
  tt <- vector("numeric")
  for (i in id){
    
    tabla <- read.csv(paste(directorio,"/",formatC(i,width = 3, flag= "0"),".csv", sep = ""))
    completos <- complete.cases(tabla)
    t <- tabla[completos,]
  
    if (contaminante== "sulfate"){
      m <-t[,2] 
      tt <- c(tt,m)
    }else if(contaminante=="nitrate")
    { m <- (t[,3])
    tt <- c(tt,m)}
  }
    media <- mean(tt)
    media
    }

mediacontaminante("specdata","sulfate",1:2)

