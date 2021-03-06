mejor <- function(estado,resultado= ataque/falla/neumonia){
setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
# Lectura de datos   
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
# Revisi�n de la validez de estado y resultado   
    
abrev <-levels(factor(outcome[,7]))
    if (estado %in% abrev == F){
         stop("Estado inv�lido") # break  
}
    
    
col <- if (resultado == "ataque") {
        11 
     } else if (resultado == "falla") {
        17 
    } else if (resultado == "neumonia") {
        23 
    } else { TRUE}
    
if (col ==TRUE) { stop("Resultado inv�lido")}
# Regresa el nombre del hospital con la tasa m�s baja de mortalidad de 30 d�as 
    
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
