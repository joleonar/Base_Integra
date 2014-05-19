# Crea bases de datos de los catalogos que se van a unificar en formato Rda
# Lectura de los eventos ocurridos periodo 1982-1989 de las bases de datos originales
# conteo de los eventos en cada año selección de los eventos en la región venezolana 
latN <- 14
latS <- 5
lonO <- -74 
lonE <- -58

## De la base CATALOGO_FUNVISIS_ULA.txt se extrajo base1982-89.txt
 base <- read.table("base1982-89.txt",header=T) #Lee la base de datos a un data.frame
 #names(base)
 print(paste("Numero de sismos en FUNVISIS_ULA entre 1982 -1989: ",nrow(base)) )
 base_FUN <- subset(base,base$lat > latS & base$lat<latN & base$lon>lonO & base$lon<lonE)
 save(base_FUN, file="FUNV_ven82-89.Rda")
 s <- split(base,base$ano) 
 nt <- sapply(s, function(x) nrow(x))

 lat_min <- min(base$lat)
 lat_max <- max(base$lat)
 lon_min <- min(base$lon)
 lon_max <- max(base$lon)

 ## Coordenadas región venezolana

 #print(lat_min)
 #print(lat_max)
 #print(lon_min)
 #print(lon_max)

## 1. De la base IRIS_1964_2008.txt se extrajo IRIS_1982-892.txt
base1 <- read.table("IRIS_1982-89_2.txt",header=T) #Lee la base de datos a un data.frame
Fecha1 <- as.character(base1$fecha)
year1 <- substr(as.vector(Fecha1),1,4)
s1 <- split(as.vector(year1),as.vector(year1)) 
nt1 <- sapply(s1,function(x) length(x))
print(paste("Numero de sismos en IRIS entre 1982 -1989: ",nrow(base1)) )
base_IRIS <- subset(base1,base1$lat > latS & base1$lat<latN & base1$lon>lonO & base1$lon<lonE)
save(base_IRIS, file="IRIS_ven82-89.Rda")
 
## 2. De la base ISC_1964_2008.txt se extrajo ISC_1982-89.csv
base2 <- read.csv("ISC_1982-89.txt",header=T) #Lee la base de datos a un data.frame
#names(base)
print(paste("Numero de sismos en ISC entre 1982 -1989: ",nrow(base2)) )
Fecha2 <- as.character(base2$DATE)
year <- substr(as.vector(Fecha2),1,4)
#num_year <- levels((as.factor(year)))
#unique comando
s2 <- split(as.vector(year),as.vector(year)) 
nt2 <- sapply(s2,function(x) length(x))
base_ISC <- subset(base2,base2$LA > latS & base2$LA<latN & base2$LON>lonO & base2$LON<lonE)
save(base_ISC, file="ISC_ven82-89.Rda")

## 3. De la base NEIC-PDE.txt se extrajo NEIC_PDE1982-89.csv
base3 <- read.csv("NEIC_PDE1982-89.csv",header=T) #Lee la base de datos a un data.frame
s3 <- split(base3,base3$YEAR) 
nt3 <- sapply(s3,function(x) nrow(x))
print(paste("Numero de sismos en NEIC-PDE entre 1982 -1989: ",nrow(base3)) )
base_NEIC <- subset(base3,base3$LAT > latS & base3$LAT<latN & base3$LON>lonO & base3$LON<lonE)
save(base_NEIC, file="NEIC_ven82-89.Rda")

 ## 4. De la base CERESISE.txt se extrajo Cereseis1982-1989.txt
 base4 <- read.table("Ceresis_1982-89.txt",header=T) #Lee la base de datos a un data.frame
 s4 <- split(base4,base4$Año)
 nt4 <- sapply(s4,function(x) nrow(x))
 print(paste("Numero de sismos en CERESIS entre 1982 -1989: ",nrow(base4)) )
 base_CERE <- subset(base4,base4$Lat > latS & base4$Lat<latN & base4$Long>lonO & base4$Long<lonE)
 save(base_CERE, file="CERESIS_ven82-89.Rda")
  
 ## 5. De la base Centennial.txt se extrajo Centennial_1982-89.txt
 base5 <- read.table("Centennial1982-89.txt",header=T) #Lee la base de datos a un data.frame
 s5 <- split(base5,base5$yr)
 nt5 <- sapply(s5,function(x) nrow(x))
 print(paste("Numero de sismos en Centennial entre 1982 -1989: ",nrow(base5)) )
 base_CENT <- subset(base5,base5$glat > latS & base5$glat<latN & base5$glon>lonO & base5$glon<lonE)
 save(base_CENT, file="Centennial_ven82-89.Rda")
 
 
#print(nt1)
#print(nt2)
#print(nt3)
