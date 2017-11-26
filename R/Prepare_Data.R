rm(list=ls())

library(tidyverse)


## Pies mayores
    mayores <- read_delim("./data_raw/mayores_IFN2_IFN3.txt", 
        "\t", escape_double = FALSE, trim_ws = TRUE)
    mayores <- tbl_df(mayores)
    mayores$CD[mayores$CD == 53] <- 55
    mayores <- mayores%>% 
        filter(Especie !="#N/A", Especie!="0") %>%
        mutate(Dist=Distanci,DiamIf3=(Dn/10),
                      DiamIf2= (DNIFN2/10), HeiIf3=Ht)
    mayores <- select(mayores, Codi,Provincia,Cla,Subclase, Especie,Rumbo,Dist,Fac,
                      CD,DiamIf3, DiamIf2, HeiIf3)
    mayores$Codi <- as.factor(mayores$Codi)
    mayores$Cla <- as.factor(mayores$Cla)
    mayores$Subclase <- as.factor(mayores$Subclase)
    mayores$Especie <- as.factor(mayores$Especie)

    
## Parcelas    
    parcelas <- read_delim("./data_raw/Parcelas.txt", 
        "\t", escape_double = FALSE, trim_ws = TRUE)
    parcelas <- parcelas %>% filter( !Cla=="R",!Subclase=="3C")
    
    parcelas$dupl <- duplicated(parcelas$Codi)
    parcelas$Codi <- as.factor(parcelas$Codi)
    parcelas$Cla <- as.factor(parcelas$Cla)
    parcelas$Subclase <- as.factor(parcelas$Subclase)
    parcelas <- tbl_df(parcelas)
    
    #View(parcelas)
    
    parcelas$FechaIni <- sapply(strsplit(as.character(parcelas$FechaIni), " "), "[", 1)
    parcelas$HoraIni <- sapply(strsplit(as.character(parcelas$HoraIni), " "), "[", 2)
    parcelas$FechaIni <- as.Date(parcelas$FechaIni, format="%d/%m/%Y")
    parcelas$HoraIni <- as.POSIXct(strptime(parcelas$HoraIni, format="%H:%M:%S"))
    
    parcelas$FechaFin <- sapply(strsplit(as.character(parcelas$FechaFin), " "), "[", 1)
    parcelas$HoraFin <- sapply(strsplit(as.character(parcelas$HoraFin), " "), "[", 2)
    parcelas$FechaFin <- as.Date(parcelas$FechaFin, format="%d/%m/%Y")
    parcelas$HoraFin <- as.POSIXct(strptime(parcelas$HoraFin, format="%H:%M:%S"))
    
    parcelas$FechaPh <- sapply(strsplit(as.character(parcelas$FechaPh), " "), "[", 1)
    parcelas$HoraPh <- sapply(strsplit(as.character(parcelas$HoraPh), " "), "[", 2)
    parcelas$FechaPh <- as.Date(parcelas$FechaPh, format="%d/%m/%Y")
    parcelas$HoraPh <- as.POSIXct(strptime(parcelas$HoraPh, format="%H:%M:%S"))
    
    parcelas <- select (parcelas, Codi:FechaPh)
    
## CD por parcela y especie   
    especies <- mayores %>%
        group_by(Codi,Especie, CD) %>%
        summarise(n=sum(Fac))%>% 
        spread(CD,n) 
    especies[is.na(especies)] <- 0
    colnames(especies)[3:15] <- paste0("CD_",colnames(especies)[3:15] )
    especies$Codi <- as.factor(especies$Codi)

## Coordenadas de las parcelas
    coordenadas <- read_delim("./data_raw/ParcelasMapa.txt", 
                              "\t", escape_double = FALSE, trim_ws = TRUE)
    
    coordenadas <-  select(coordenadas, Codi,Provincia, Estadillo, Cla=Clase, CoorX, CoorY)
    coordenadas <- tbl_df(coordenadas)
    coordenadas$Codi <- as.factor(coordenadas$Codi)
    coordenadas$Cla <- as.factor(coordenadas$Cla)

    
    
    save(mayores,parcelas, especies, coordenadas, file="./data/data_workshop.Rdata")

    