# Código para importar, modificar y unir bases de datos 

# Borrar ambiente

rm(list = ls())

# Cambiar espacio de trabajo

setwd("C:\\Users\\user\\Documents\\roy\\roche\\luis")

# Instalar librerías

# install.packages(c("tidyverse", "readxl"))
#install.packages("writexl")

# Llamar librerías

library("tidyverse")
library("readxl")
#library("write.xlxs")
library(writexl)

# Importar cada base

lnh11<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\NHL\\LNH_2011.xlsx",
                  sheet = "BD", col_names = T)

# Cambiar el nombre del objeto y el nombre de la hoja si es necesario

lnh12<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\NHL\\LNH_2012.xlsx",
                  sheet = "BDD", col_names = T)


lnh13<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\NHL\\LNH_2013.xlsx",
                  sheet = "BDD", col_names = T)

lnh14<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\NHL\\LNH_2014.xlsx",
                  sheet = "Hoja1", col_names = T)

lnh15<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\NHL\\LNH_2015.xlsx",
                  sheet = "BDD", col_names = T)

SIG16<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\NHL\\SIGGC 2016.xlsx",
                  col_names = T)

# Filtrar base del 2016

lnh16 <- SIG16 %>% filter(PATOLOGIA_CORREGIDA == "Linfoma no Hodgkin" | 
                            PATOLOGIA_CORREGIDA == "Difuso" |
                            PATOLOGIA_CORREGIDA == "Folicular")

# Renombrar variables

lnh1<- lnh11 %>% 
  rename(
    EDAD= `Edad en Años`,
    FOLIO = `Folio afiliación`,
    DECLARATORIA = `Núm Declaratoria`,
    AMATERNO = `Apellido Materno`,
    APATERNO = `Apellido Paterno`,
    NOMBRE = Nombre, 
    FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = `Fecha Aplicacion`,
    FECHA_DX = `Fecha Diagnóstico`,
    SEXO = Sexo,
    ESTADO_ORIGEN = `Entidad Procedencia`,
    MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = `Entidad Federativa Prestador`,
    PRESTADOR = `Prestador de Servicio`,
    EXPEDIENTE = `Expediente Médico`,
    CATEGORIA = Categoría,
    PATOLOGIA = Patología,
    MONTO = `Tabulador del Diagnóstico`,
    MOTIVO_EGRESO = `Motivo Egreso`,
    TIPO_ATENCION = `Tipo Atención`,
    TIPO = Grupo
  )

# Agregar columna del año

lnh1$ANIO=2011

# Cambiar nombre de variables

lnh2<- lnh12 %>% 
  rename(
    EDAD= `Edad en Años`,
    FOLIO = `Folio afiliación`,
    DECLARATORIA = `Núm Declaratoria`,
    AMATERNO = `Apellido Materno`,
    APATERNO = `Apellido Paterno`,
    NOMBRE = Nombre, 
    FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = `Fecha Aplicacion`,
    FECHA_DX = `Fecha Diagnóstico`,
    SEXO = Sexo,
    ESTADO_ORIGEN = `Entidad Procedencia`,
    MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = `Entidad Federativa Prestador`,
    PRESTADOR = `Prestador de Servicio`,
    EXPEDIENTE = `Expediente Médico`,
    CATEGORIA = Categoría,
    PATOLOGIA = Patología,
    MONTO = `Tabulador del Diagnóstico`,
    MOTIVO_EGRESO = `Motivo Egreso`,
    TIPO_ATENCION = `Tipo Atención`,
    TIPO = Grupo
  )

# Agregar año

lnh2$ANIO=2012

# La base del 2013 no contiene apellidos y en lugar de ello un nombre completo

lnh3<- lnh13 %>% 
  rename(
    EDAD= Edad,
    FOLIO = `Folio`,
    DECLARATORIA = Declaratoria,
    #AMATERNO = `Apellido Materno`,
    #APATERNO = `Apellido Paterno`,
    NOMBRE_COMPLETO = Nombre, 
    #FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = `Fecha de Atención`,
    FECHA_DX = `Fecha de Diagnóstico`,
    SEXO = Sexo,
    ESTADO_ORIGEN = `Estado de Origen`,
    #MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = `Entidad Federativa`,
    PRESTADOR = `Prestador`,
    EXPEDIENTE = `Expediente Médico`,
    #CATEGORIA = Categoría,
    PATOLOGIA = Patología,
    MONTO = Monto,
    #MOTIVO_EGRESO = `Motivo Egreso`,
    #TIPO_ATENCION = Atención,
    TIPO = Grupo,
    TIPO_ATENCION = `Fase Atención` ,
    FASE_ATENCION = `Tipo Fase Atención`,
    ETAPA = Etapa,
    FECHA_EGRESO = `Fecha de Egreso`,
    TIPO_CASO = `Tipo de caso`
  )

# Agregar año

lnh3$ANIO=2013

# En la base del 2014 el estado se codifica como numérico; hay que convertirlo a caracter antes de unir las bases

lnh14$ESTADO_ORIGEN<-factor(lnh14$`Estado de Origen`)

lnh4<- lnh14 %>% 
  rename(
    EDAD= Edad,
    FOLIO = Folio,
    DECLARATORIA = Declaratoria,
    #AMATERNO = `Apellido Materno`,
    #APATERNO = `Apellido Paterno`,
    NOMBRE_COMPLETO = Nombre, 
    #FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = `Fecha de Atención`,
    FECHA_DX = `Fecha de Diagnóstico`,
    SEXO = Sexo,
    #ESTADO_ORIGEN = `Estado de Origen`,
    #MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = `Entidad Federativa`,
    PRESTADOR = `Prestador`,
    EXPEDIENTE = `Expediente Médico`,
    #CATEGORIA = Categoría,
    PATOLOGIA = Patología,
    MONTO = Monto,
    #MOTIVO_EGRESO = `Motivo Egreso`,
    #TIPO_ATENCION = Atención,
    TIPO = Grupo,
    TIPO_ATENCION = `Fase Atención` ,
    FASE_ATENCION = `Tipo Fase Atención`,
    ETAPA = Etapa,
    FECHA_EGRESO = `Fecha de Egreso`,
    TIPO_CASO = `Tipo de caso`,
    DIAGNOSTICO = Diagnóstico
  )

# Agregar año

lnh4$ANIO=2014

# Cambiar nombres de variables 2015

lnh5<- lnh15%>%
  rename(
    EDAD_1= Edad,
    FOLIO = Folio,
    DECLARATORIA = Declaratoria,
    #AMATERNO = `Apellido Materno`,
    #APATERNO = `Apellido Paterno`,
    NOMBRE_COMPLETO = Nombre, 
    #FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = `Fecha de Atención`,
    FECHA_DX = `Fecha de Diagnóstico`,
    SEXO = Sexo,
    #ESTADO_ORIGEN = `Estado de Origen`,
    #MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = `Estado`,
    PRESTADOR = `Prestador`,
    EXPEDIENTE = `Expediente Médico`,
    #CATEGORIA = Categoría,
    PATOLOGIA = Patología,
    MONTO = Monto,
    #MOTIVO_EGRESO = `Motivo Egreso`,
    #TIPO_ATENCION = Atención,
    TIPO = Grupo,
    TIPO_ATENCION = `Fase Atención` ,
    FASE_ATENCION = `Tipo Fase Atención`,
    ETAPA = Etapa,
    FECHA_EGRESO = `Fecha de Egreso`,
    TIPO_CASO = `Tipo de caso`  
  )

# Hacer para cada año

lnh5$ANIO=2015

# Cambiar tipo de variable EDAD_1 a EDAD

lnh5$EDAD<-as.numeric(lnh5$EDAD_1)

# Quedarse con las variables útiles del 2016

lnh6<-lnh16%>%
  select("ESTADO","PRESTADOR","CLUES","BENEFICIARIO","SEXO","EDAD","DECLARATORIA",
         "EXPEDIENTE","CURP","FECHA_DIAGNOSTICO", "PATOLOGIA_CORREGIDA", "ETAPA", 
         "FECHA_ATENCION", "TIPO_CASO", "FOLIO_CORREGIDO","ATENCION_CORREGIDA","MONTO_CORREGIDO","ANIOS")

lnh6 <- lnh6 %>% 
  rename(
    #EDAD= Edad,
    FOLIO = FOLIO_CORREGIDO,
    #DECLARATORIA = Declaratoria,
    #AMATERNO = `Apellido Materno`,
    #APATERNO = `Apellido Paterno`,
    NOMBRE_COMPLETO = BENEFICIARIO, 
    #FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = FECHA_ATENCION,
    FECHA_DX = FECHA_DIAGNOSTICO,
    #SEXO = Sexo,
    #ESTADO_ORIGEN = `Estado de Origen`,
    #MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = ESTADO,
    #PRESTADOR = `Prestador`,
    #EXPEDIENTE = `Expediente Médico`,
    #CATEGORIA = Categoría,
    TIPO = PATOLOGIA_CORREGIDA,
    MONTO = MONTO_CORREGIDO,
    #MOTIVO_EGRESO = `Motivo Egreso`,
    #TIPO_ATENCION = Atención,
    #TIPO = Grupo,
    TIPO_ATENCION = ATENCION_CORREGIDA ,
    #FASE_ATENCION = `Tipo Fase Atención`,
    #ETAPA = Etapa,
    #FECHA_EGRESO = `Fecha de Egreso`,
    ANIO = ANIOS
    #TIPO_CASO = `Tipo de caso`    
  )

# Quitar variables sin uso de las demás bases

lnh1<- select(lnh1,c(-no.,-`Fecha Validación`))
lnh2<- select(lnh2, c(-No.,-`Fecha Validación`))
lnh3<- select(lnh3, c(-BDD,-`Origen de Dato`,-Órgano))
lnh4<- select(lnh4, c(-`N°`,-Órgano, -`Fecha de Captura`, `Estado de Origen`,
                      -Responsable, -`Año 1=2014 2=2015`, -`No. FPGC`,`Fases de atención`,-Observaciones))
lnh5<- select(lnh5, c(-No.,-Registro,-Órgano,-`Fases de atención`,-Comentario,-Considerar,-`Año de atención`,
                      Folio2,`No FPGC`))

lnh1_1<-select(lnh1,c(NOMBRE,APATERNO, AMATERNO,FOLIO, ANIO, FECHA_NACIMIENTO,EDAD, ESTADO_ORIGEN, 
                      ESTADO_PRESTADOR, PRESTADOR))
lnh2_1<-select(lnh2,c(NOMBRE,APATERNO, AMATERNO,FOLIO, ANIO, FECHA_NACIMIENTO,EDAD, ESTADO_ORIGEN, 
                      ESTADO_PRESTADOR, PRESTADOR))
lnh3_1<-select(lnh3,c(NOMBRE_COMPLETO,FOLIO, ANIO, EDAD,ESTADO_PRESTADOR, PRESTADOR))
lnh4_1<-select(lnh4,c(NOMBRE_COMPLETO,FOLIO, ANIO, EDAD, 
                      ESTADO_PRESTADOR, PRESTADOR))
lnh5_1<-select(lnh5,c(NOMBRE_COMPLETO,FOLIO, ANIO, EDAD, 
                      ESTADO_PRESTADOR, PRESTADOR))
lnh6_1<-select(lnh6,c(NOMBRE_COMPLETO,FOLIO, ANIO, EDAD, CURP, 
                      ESTADO_PRESTADOR, PRESTADOR))


# Si usáramos el comando rbind para unir las tablas, tendríamos que 
# añadir todas las columnas faltantes a cada año. Esto no es necesario con bind_rows
#lnh1<-lnh1%>%add_column(...)

# Concatenar bases de datos. Todas las variables tienen que tener el mismo nombre

lnh <-bind_rows(lnh1_1, lnh2_1, lnh3_1, lnh4_1, lnh5_1,lnh6_1)

#lnh <-rbind(lnh1.1, lnh2.1, lnh3.1)

# Agregar número de ID

lnhid <- tibble::rowid_to_column(lnh, "ID")

lnhnames <- lnhid%>%
  filter(ANIO > 2012)

#lnhnames2 %>% 
#  select(lnhid, c(ID,ANIO,FECHA_NACIMIENTO,EDAD,ESTADO_ORIGEN,CURP,FOLIO))%>%
#  rename()

# Exportar base de datos en CSV

write.csv(lnhid,"C:\\Users\\user\\Documents\\roy\\roche\\luis\\LNH_NOMBRES_2.csv")

#write_xlsx(lnh, "C:\\Users\\user\\Documents\\roy\\roche\\luis\\LNH_NOMBRES.xls")

# Abrir base de Luis

luis<-read_excel("C:\\Users\\user\\Documents\\roy\\roche\\luis\\bases\\LNH_NOMBRES_2_LSR_EDICION.xlsx",
                 sheet = "LNH_NOMBRES_2_roy", col_names = T)


# Unir con base de Luis

lnhluis <- merge(lnhid, luis,
                 by.x = "ID",
                 all.x=TRUE)

?merge

lnhluis1<- select(lnhluis, c(-NOMBRE,-NOMBRE_COMPLETO, -AMATERNO, -APATERNO, -ANIO_LUIS,-FOLIO_LUIS)) 

lnhluis2<-rename(lnhluis1,
                 AMATERNO = AMATERNO_LUIS,
                 APATERNO = APATERNO_LUIS,
                 NOMBRE = NOMBRE_LUIS,
                 NOMBRE_COMPLETO = NOMBRE_COMPLETO_LUIS)

write.csv(lnhluis2,"C:\\Users\\user\\Documents\\roy\\roche\\luis\\LNH_NOMBRES_EVA_3.csv")

lnhdi<-select(lnhluis2,c(-NOMBRE,-NOMBRE_COMPLETO,-AMATERNO,-APATERNO))

#mytable<-xtabs(~lnhluis2$ESTADO_PRESTADOR)

#tablaestado<-table(lnhluis2$ESTADO_PRESTADOR)
#tablaestado<-prop.table(tablaestado)
tablaestado<-as.data.frame(table(lnhluis2$ESTADO_PRESTADOR))
write.csv(tablaestado,"C:\\Users\\user\\Documents\\roy\\roche\\luis\\tablaestado_lnh.csv")

#labels(tablaestado, c("ESTADO_PRESTADOR","FRECUENCIA_ESTADO"))   

# Generar datos de para armonización

## Estado de origen

tablaestadoor<-as.data.frame(table(lnhid$ESTADO_ORIGEN))
write.csv(tablaestadoor,"C:\\Users\\user\\Documents\\roy\\roche\\luis\\tablaestadoor_lnh.csv")

## Prestador

tablaprestador<-as.data.frame(table(lnhid$PRESTADOR))
write.csv(tablaprestador,"C:\\Users\\user\\Documents\\roy\\roche\\luis\\tablaprestador_lnh.csv")





################## Other

lnh3<- lnh13 %>% 
  rename(
    EDAD= `Edad en Años`,
    FOLIO = `Folio afiliación`,
    DECLARATORIA = `Núm Declaratoria`,
    AMATERNO = `Apellido Materno`,
    APATERNO = `Apellido Paterno`,
    NOMBRE = Nombre, 
    FECHA_NACIMIENTO = `Fecha Nacimiento`,
    FECHA_TX = `Fecha Aplicacion`,
    FECHA_DX = `Fecha Diagnóstico`,
    SEXO = Sexo,
    ESTADO_ORIGEN = `Entidad Procedencia`,
    MUNICIPIO = `Municipio Procedencia`,
    ESTADO_PRESTADOR = `Entidad Federativa Prestador`,
    PRESTADOR = `Prestador de Servicio`,
    EXPEDIENTE = `Expediente Médico`,
    CATEGORIA = Categoría,
    PATOLOGIA = Patología,
    MONTO = `Tabulador del Diagnóstico`,
    MOTIVO_EGRESO = `Motivo Egreso`,
    TIPO_ATENCION = Atención,
    TIPO = Grupo
  )

#install.packages("fpp2")

#install.packages("mdthemes")

#install.packages("knitr")
#install.packages("cairoDevice")

#install.packages('tinytex')
#tinytex::install_tinytex()
