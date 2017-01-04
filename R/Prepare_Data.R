rm(list=ls())

library(tidyr)
library(dplyr)
library(tidyr)
library(ggplot2)


## Pies mayores
    mayores <- read_delim("~/Dropbox (FiDBosc)/Research/dplyr_workshop/data/mayores_IFN2_IFN3.txt", 
        "\t", escape_double = FALSE, trim_ws = TRUE)
    mayores <- tbl_df(mayores)
    mayores$CD[mayores$CD == 53] <- 55
    mayores <- mutate(mayores,Dist=Distanci,DiamIf3=(Dn/10),HeiIf3=Ht,
                      DiamIf2= (DNIFN2/10), HeiIf2=ALTURAIFN2)
    mayores <- select(mayores, Codi,Provincia,Estadillo,Cla,Subclase, nArbol, OrdenIf3,OrdenIf2,Especie,Rumbo,Dist,Fac,
                      CD,DiamIf3, HeiIf3, DiamIf2, HeiIf2)
    mayores$Codi <- as.factor(mayores$Codi)
    save(mayores,file="./data/mayores.Rdata")
    
    
## Parcelas    
    parcelas <- read_delim("./data/Parcelas.txt", 
        "\t", escape_double = FALSE, trim_ws = TRUE)
    parcelas <- parcelas %>% filter(Cla=="A")
    parcelas$Codi <- as.factor(parcelas$Codi)
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
    
    save(parcelas, file="./data/parcelas.Rdata")

    
## CD por parcela y especie   
    especies <- mayores %>%
        group_by(Codi,Especie, CD) %>%
        summarise(n=sum(Fac))%>% 
        spread(CD,n) 
    especies[is.na(especies)] <- 0
    colnames(especies)[3:15] <- paste0("CD_",colnames(especies)[3:15] )
    especies$Codi <- as.factor(especies$Codi)
    save(especies, file="./data/especies.Rdata")

    
    

