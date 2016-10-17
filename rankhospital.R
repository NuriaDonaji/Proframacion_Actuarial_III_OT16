rankhospital <- function(estado, resultado = ataque/falla/neumonia, num ="mejor") { 
setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
   
# Lectura de datos 
   
     outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
# Revisión de la validez de estado y resultado 
     
     abrev <-levels(factor(outcome[,7]))
     if (estado %in% abrev == F){
         stop("Estado inválido") # break  
     }
    
     col <- if (resultado == "ataque") {
        11 
    } else if (resultado == "falla") {
        17 
    } else if (resultado == "neumonia") {
        23 
    } else { TRUE}
    
    if (col ==TRUE) { stop("Resultado inválido")}
    
# Regresa el nombre del hospital con el puesto dado de la tasa más  baja de mortalidad de 30 días 
a <- outcome[outcome$State == estado,]
b <- a[,col]
Hospital <- a[,2]
d <- cbind(Hospital,b)
e<-suppressWarnings(as.numeric(d[,2]))
#orden<-suppressWarnings(order(e,na.last = NA))
orden<-suppressWarnings(order(e,na.last = NA))
orden2<-suppressWarnings(d[orden,])

 if (num=="mejor"){
    orden2[1]
 }else if (num=="peor"){
     tail(orden2)[6]
 }else {
    orden2[num-1]
  }
}
rankhospital("TX","falla",4)
rankhospital("MD","ataque","peor")
rankhospital("MD","ataque",5000)

