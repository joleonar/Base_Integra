## Crea bases de datos de los catalogos que se van a unificar en formato Rda
# Lectura de los eventos ocurridos periodo 1982-1989 de las bases de datos originales
# conteo de los eventos en cada año selección de los eventos en la región venezolana 

## Coordenadas Region Venezolana
latN <-  14; latS <-  5
lonO <- -74; lonE <- -58

## 0. De la base CATALOGO_FUNVISIS_ULA.txt se extrajo base1982-89.txt
base <- read.table("base1982-89.txt",header=T) #Lee la base de datos a un data.frame
print(paste("Numero de sismos en FUNVISIS_ULA entre 1982 -1989: ",nrow(base)) )
base_FUN <- subset(base,base$lat >= latS & base$lat<=latN & base$long>=lonO & base$long<=lonE)
save(base_FUN, file="FUNV_ven82-89.Rda")
print(paste("Numero de sismos en FUNVISIS_ULA para la region: ",nrow(base_FUN))) 


## 1. De la base IRIS_1964_2008.txt se extrajo IRIS_1982-892.txt
base1 <- read.table("IRIS_1982-89_2.txt",header=T) #Lee la base de datos a un data.frame
print(paste("Numero de sismos en IRIS entre 1982 -1989: ",nrow(base1)) )
base_IRIS <- subset(base1,base1$lat >= latS & base1$lat<=latN & base1$lon>=lonO & base1$lon<=lonE)
save(base_IRIS, file="IRIS_ven82-89.Rda")
print(paste("Numero de sismos en IRIS para la region: ",nrow(base_IRIS))) 

## 2. De la base ISC_1964_2008.txt se extrajo ISC_1982-89.csv
base2 <- read.csv("ISC_1982-89.txt",header=T) #Lee la base de datos a un data.frame
print(paste("Numero de sismos en ISC entre 1982 -1989: ",nrow(base2)) )
base_ISC <- subset(base2,base2$LA >= latS & base2$LA<=latN & base2$LON>=lonO & base2$LON<=lonE)
save(base_ISC, file="ISC_ven82-89.Rda")
print(paste("Numero de sismos en ISC para la region: ",nrow(base_ISC))) 

## 3. De la base NEIC-PDE.txt se extrajo NEIC_PDE1982-89.csv
base3 <- read.csv("NEIC_PDE1982-89.csv",header=T) #Lee la base de datos a un data.frame
print(paste("Numero de sismos en NEIC-PDE entre 1982 -1989: ",nrow(base3)) )
base_NEIC <- subset(base3,base3$LAT >= latS & base3$LAT<=latN & base3$LON>=lonO & base3$LON<=lonE)
print(paste("Numero de sismos en NEIC-PDE en la region: ",nrow(base_NEIC)))
save(base_NEIC, file="NEIC_ven82-89.Rda")

## 4. De la base CERESISE.txt se extrajo Cereseis1982-1989.txt
base4 <- read.table("Ceresis_1982-89.txt",header=T) #Lee la base de datos a un data.frame
print(paste("Numero de sismos en CERESIS entre 1982 -1989: ",nrow(base4)) )
base_CERE <- subset(base4,base4$Lat >= latS & base4$Lat<=latN & base4$Long>=lonO & base4$Long<=lonE)
save(base_CERE, file="CERESIS_ven82-89.Rda")
print(paste("Numero de sismos en CERESIS para la region: ",nrow(base_CERE))) 

## 5. De la base Centennial.txt se extrajo Centennial_1982-89.txt
base5 <- read.table("Centennial1982-89.txt",header=T) #Lee la base de datos a un data.frame
print(paste("Numero de sismos en Centennial entre 1982 -1989: ",nrow(base5)) )
base_CENT <- subset(base5,base5$glat >= latS & base5$glat<=latN & base5$glon>=lonO & base5$glon<=lonE)
save(base_CENT, file="Centennial_ven82-89.Rda")
print(paste("Numero de sismos en Centennial para la region: ",nrow(base_CENT)))  
