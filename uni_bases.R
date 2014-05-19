load("FUNV_ven82-89.Rda")
load("IRIS_ven82-89.Rda") 
load("ISC_ven82-89.Rda")
load("NEIC_ven82-89.Rda")
load("CERESIS_ven82-89.Rda")
load("Centennial_ven82-89.Rda")

#Convirtiendo base IRIS 
ano <- substr(base_IRIS$fecha,1,4)
mes <- substr(base_IRIS$fecha,6,7)
dia <- substr(base_IRIS$fecha,9,10)
hh  <- substr(base_IRIS$hhmmss,1,2)
min <- substr(base_IRIS$hhmmss,3,4)
sec <- substr(base_IRIS$hhmmss,5,6)
lat <- base_IRIS$lat
lon <- base_IRIS$lon
prof<- base_IRIS$prof
age <- base_IRIS$age
mag <- base_IRIS$mag
tip_mag <-  base_IRIS$tmag
tip_mag[tip_mag=='(null)']=NA

base_IRIS2 <-data.frame(ano,mes,dia,hh,min,sec,lat,lon,prof,age,mag,tip_mag)

#Convirtiendo base ISC
ano <- substr(base_ISC$DATE,1,4)
mes <- substr(base_ISC$DATE,6,7)
dia <- substr(base_ISC$DATE,9,10)
hh  <- substr(base_ISC$TIME,1,2)
min <- substr(base_ISC$TIME,4,5)
sec <- substr(base_ISC$TIME,7,10)
lat <- base_ISC$LA
lon <- base_ISC$LON
prof<- base_ISC$DEPTH
age <- base_ISC$AUT1
mag <- base_ISC$MAG1
tip_mag <-  base_ISC$TYPE1
tip_mag[tip_mag=="      "]=NA

base_ISC2 <-data.frame(ano,mes,dia,hh,min,sec,lat,lon,prof,age,mag,tip_mag)

#Convirtiendo base NEIC
ano <- base_NEIC$YEAR
mes <- base_NEIC$MO
dia <- base_NEIC$DAY
hh  <- substr(base_NEIC$ORIG_TIME,1,2)
min <- substr(base_NEIC$ORIG_TIME,3,4)
sec <- substr(base_NEIC$ORIG_TIME,5,9)
lat <- base_NEIC$LAT
lon <- base_NEIC$LON
prof<- base_NEIC$DEP
age <- base_NEIC$CAT
mag <- base_NEIC$MAG
tip_mag <-  base_NEIC$IEFM
#tip_mag[tip_mag=="      "]=NA

base_NEIC2 <-data.frame(ano,mes,dia,hh,min,sec,lat,lon,prof,age,mag,tip_mag)

#Convirtiendo base CERE
ano <- base_CERE$Año
mes <- base_CERE$Mes
dia <- base_CERE$Día
hh  <- base_CERE$Hora
min <- base_CERE$Min
sec <- base_CERE$Seg
lat <- base_CERE$Lat
lon <- base_CERE$Long
prof<- base_CERE$Dep
age <- rep("CERE",length(ano))
mag <- base_CERE$mb
tip_mag <-  rep("mb",length(ano))
#tip_mag[tip_mag=="      "]=NA

base_CERE2 <-data.frame(ano,mes,dia,hh,min,sec,lat,lon,prof,age,mag,tip_mag)


#Convirtiendo base CENT
ano <- base_CENT$yr
mes <- base_CENT$mon
dia <- base_CENT$day
hh  <- base_CENT$hr
min <- base_CENT$min
sec <- base_CENT$sec
lat <- base_CENT$glat
lon <- base_CENT$glon
prof<- base_CENT$dep
age <- base_CENT$mdo
mag <- base_CENT$mag1
tip_mag <-  base_CENT$msc1
#tip_mag[tip_mag=="      "]=NA
base_CENT2 <-data.frame(ano,mes,dia,hh,min,sec,lat,lon,prof,age,mag,tip_mag)


cuenta_base <- function(base,param) {
  eventos <- nrow(base) 
  yr_event <- table(base[param[1]])
  lat_rg <- range(base[param[2]],na.rm=TRUE)
  lon_rg <- range(base[param[3]],na.rm=TRUE)
  prof_rg <- range(base[param[4]],na.rm=TRUE)
  mag_rg <- range(base[param[5]],na.rm=TRUE)
  agencias <- table(base[param[6]])
  
  print(paste("No de eventos en la base ",eventos))
  print("Año no de eventos")
  print(yr_event)
  
  print("Agencia no eventos")
  print(agencias)
 # write(names(agencias),file="info_bases.txt",append=TRUE)  
#  write(as.vector(agencias),file="info_bases.txt",append=TRUE)  
  print("Rango latitud")
  print(lat_rg)
  
  print("Rango longitud")
  print(lon_rg)
  
  print("Rango profundidad")
  print(prof_rg)
  
  print("Rango magnitudes")
  print(mag_rg)
}

# print("Para la base FUNV")
param <- c(1,7,8,9,11,10)
# cuenta_base(base_FUN,param)
# print("Para la base IRIS")
# cuenta_base(base_IRIS2,param)
base_d <- list(base_FUN,base_IRIS2,base_ISC2,base_NEIC2,base_CERE2,base_CENT2)
lapply(base_d,cuenta_base,param)
