mejor <- function(estado,resultado= ataque/falla/neumonia){
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
# Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 
    
a <- outcome[outcome$State == estado,]
b <- a[,col]
Hospital <- a[,2]
d <- cbind(Hospital,b)

e<-suppressWarnings(as.numeric(d[,2]))
orden<-suppressWarnings(order(e,na.last = NA))
orden2<-suppressWarnings(d[orden,])
orden2[1]

}  
mejor("TX","ataque")
mejor("TX","falla")
mejor("MD","ataque")
mejor("MD","neumonia")
mejor("BB","ataque")
mejor("NY","atake")
