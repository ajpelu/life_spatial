
# Procesa C1 
library('rgdal')
library("leaflet") 
library("sp")
library("sf")
library("fs")
library("raster")
library("dplyr")
library("here")
library("mapview")
library("maptools")
library("purrr")
library("tidyverse")


# C1 
m <- here::here("raw_data/C1/20190930_capas/")

psylv <- rgdal::readOGR(dsn = m, layer = "20160420_C1_P_sylvestris", verbose = FALSE, encoding = "UTF-8")
phal <- rgdal::readOGR(dsn = m, layer = "20160429_C1_P_halepensis", verbose = FALSE, encoding = "UTF-8")
ppina <- rgdal::readOGR(dsn = m, layer = "20160422_C1_P_pinaster", verbose = FALSE, encoding = "UTF-8")
pnigra <- rgdal::readOGR(dsn = m,layer = "20160504_C1_P_nigra", verbose = FALSE, encoding = "UTF-8")


names(phal)[5] <- "X4Ha"
psylv$ESPECIE <- "Pinus sylvestris"

# Merge spatial layers
p <- bind(ppina, pnigra, psylv, phal)
names(p)[9] <- "idSpatial"

# Read dicc control 
d <- read.csv(here::here("raw_data/dicc_controlado_c1.csv"), header=TRUE)


aux <- merge(p, d,  by="idSpatial")
spatial_c1 <- aux[, 
                  c("idSpatial", "idCuadric", "spCode",
                    "idTratam", "idReplica", "idSubTrat",
                    "site","nodo","accion",
                    "TRATAMIENT", "ESPECIE", "CUADRICULA", "lai", "X4Ha")]
writeOGR(spatial_c1, here::here("data/"), "C1", driver="ESRI Shapefile", overwrite_layer = TRUE)

## Test read 
# t <- rgdal::readOGR(dsn = here::here("data/"), layer = "C1", verbose = FALSE, encoding = "UTF-8")
