

library('rgdal')
library("leaflet") 
library("sp")
library("sf")
library("raster")
library("dplyr")
library("here")
library("mapview")
library("maptools")
library("purrr")
library("tidyverse")
library("sf")


bbox <- rgdal::readOGR(dsn='/Users/ajpelu/Downloads/',
                       layer = 'bboxSJ', verbose = TRUE, encoding = "UTF-8")


# m <- here::here("raw_data/C1") 
# psylv <- rgdal::readOGR(dsn = m, layer = "psylv", verbose = FALSE, encoding = "UTF-8")

psylv <- st_read(here::here("raw_data/C1/psylv.shp")) 

# Generate bounding box
b <- st_as_sfc(st_bbox(psylv))

# Read mde 
mde <- raster::raster('/Users/ajpelu/Google Drive/carto_publica/MDE/mde_rect/hdr.adf')

mdeCanar <- st_crop(mde, st_bbox(psylv))

elmat = matrix(raster::extract(mdeCanar,raster::extent(mdeCanar),buffer=1000),
               nrow=ncol(mdeCanar),ncol=nrow(mdeCanar))

elmat = matrix(raster::extract(mde,raster::extent(mde),buffer=1000),
               nrow=ncol(mde),ncol=nrow(mde))

elmat %>%
  sphere_shade(sunangle= 310, texture = "desert") %>%
  plot_map()

ambmat = ambient_shade(elmat)
raymat = ray_shade(elmat,lambert = TRUE)

elmat %>%
  sphere_shade(texture = "desert",progbar = FALSE) %>%
  add_water(detect_water(elmat), color="desert") %>%
  plot_3d(elmat,zscale=10,fov=0,theta=135,zoom=0.9,phi=45, windowsize = c(800,800), water = TRUE) %>%
  render_water()
