# Data Provenance C1 

## Procedencia de las capas

* UPDATE: Las capas proceden se han recibido por parte del responsable de la información (JMM) tras reunión mantenida con JMM, Rut y JMBA. Se encuentran en: 
`ADAPTAMED_iE/ACCIONES/SI/SPATIAL_INFO/life_spatial/raw_data/C1/20190930_capas/`

* ~Las capas espaciales de la C1 vienen de la carpeta del life en Google Drive, llamada `ADAPTAMED/INFORMACION_ESPACIAL/Sierra Nevada/Acción C1`~

## Información existente 

* Se trata de 4 shapes (formato `.shp`) denominados de la siguiente manera: 

  * `20160420_C1_P_sylvestris.shp` 
  * `20160420_C1_P_sylvestris.shp`
  * `20160429_C1_P_halepensis.shp`
  * `20160504_C1_P_nigra.shp`

* Existe una información básica en cada una de las capas (una tabla asociada), a saber: 

  * `id`: campo id. Se puede interpretar que es un identificador, aunque no queda claro. Además siempre presenta el valor 1. 
  * `TRATAMIENT`: se indican tres categorias: T1, T2, T3.  
  * `ESPECIE`: nombre de la especie
  * `CUADRICULA`: Especie de identificador denominado, aunque no se especifican a que corresponde cada categoría. Ejemplo `PP_T3_C_1`, entendemos que es: Pinus pinaster, Tratamiento 3, C no sabemos a ciencia cierta a aque corresponde, y 1 tampoco.
  * `4Ha`: campo factorial con información del siguiente tipo `T3_C`. Inferimos que se trata del tratamiento T3 y de la C. 
  
Asimismo existen otros campos asociados que son diferentes entre las capas. 
  
## Procesamiento 

* Creación de una capa uniforme para esta acción en el nodo Sierra Nevada. 

  * Se genera una sola capa
  * Se añaden los campos nuevos
  
* Adecuación a la estructura de base de datos propuesta para la nomenclatura de información espacial. 
* Asignación de un identificador (`idSpatial`) asociado a la base de datos creada. 



