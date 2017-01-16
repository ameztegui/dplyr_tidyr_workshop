rm(list=ls())

library(dplyr)
library(tidyr)
library(ggplot2)

load("./data/mayores.Rdata")
mayores <- tbl_df(mayores)


load("./data/parcelas.Rdata")
parcelas <- tbl_df(parcelas)

load("./data/especies.Rdata")
especies <- tbl_df(especies)

load("./data/coordenadas.Rdata")
coordenadas <- tbl_df(coordenadas)
