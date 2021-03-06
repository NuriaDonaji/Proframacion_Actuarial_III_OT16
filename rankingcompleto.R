rankingcompleto <- function(resultado= ataque/falla/neumonia, num = "mejor") { 
setwd("~/GitHub/Programacion_Actuarial_III_OT16/")
    
    # Lectura de datos  
    
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
   
     # Revisi�n de la validez de estado y resultado  
    col <- if (resultado == "ataque") {
        11 
    } else if (resultado == "falla") {
        17 
    } else if (resultado == "neumonia") {
        23 
    } else { TRUE}
    
    if (col ==TRUE) { stop("Resultado inv�lido")}
    
    # Para cada estado, encuentra el hospital con la posici�n dada. 
     

estados <- unique(outcome[,7])
estado <-estados[order(estados)]
l <- length(estados)
g<- vector()
for (i in 1:l) {
  a <- outcome[grep(estado[i],outcome$State),]
  b <- a[,col]
  Hospital <- a[,2]
  hospital <- as.character(Hospital)
  d <- cbind(Hospital,b)
  e<-suppressWarnings(as.numeric(d[,2]))
  orden<-suppressWarnings(order(e,na.last = NA))
  orden2<-suppressWarnings(d[orden,])
    
    if (num=="mejor"){
        f <- orden2[1]
    }else if (num=="peor"){
        f <- tail(orden2)[6]
    }else {
        f <-orden2[num]
    }
  
 g <- append(g, c(f, estado[i])) 
}

# Regresa un data frame con el nombre del hospital y la abreviatura del nombre del estado al que pertenece. 
g <- as.data.frame(matrix(g, l, 2, byrow = TRUE))

rownames(g) <- estados
colnames(g) = c("Hospital", "Estado")

g
}
head(rankingcompleto("ataque",20), 10)
tail(rankingcompleto("neumonia", "peor"), 3)
tail(rankingcompleto("falla"), 10)
