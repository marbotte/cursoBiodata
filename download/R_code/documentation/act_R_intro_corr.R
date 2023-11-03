## -------------------------------------------------------------------
fol_Datos <- "../Datos/"
fol_Results <- "../Resultados/"


## -------------------------------------------------------------------
# Aqui empiezan los codigos del ejercicio 1 sobre los filtros simples----
(load(paste0(fol_Datos,"diatomeas.RData")))


## -------------------------------------------------------------------
fil_her <- env_info$HER1Lyon == 2 | env_info$HER1Lyon == 6 | env_info$HER1Lyon == 7


## -------------------------------------------------------------------
fil_comp <- fil_her & reference_sites


## -------------------------------------------------------------------
sum(fil_comp)


## -------------------------------------------------------------------
sp_abund_mat_filtered <- sp_abund_mat[fil_comp,]


## -------------------------------------------------------------------
tot_abund_fil <- colSums(sp_abund_mat_filtered)
tot_abund_fil[1:10]


## -------------------------------------------------------------------
as.logical(tot_abund_fil[1:10])


## -------------------------------------------------------------------
dim(sp_abund_mat_filtered)
sp_abund_mat_filtered <- sp_abund_mat_filtered[, as.logical(colSums(sp_abund_mat_filtered))]
dim(sp_abund_mat_filtered)


## -------------------------------------------------------------------
colnames(sp_abund_mat_filtered)[1:10]
sort(colnames(sp_abund_mat_filtered))[1:10]
sp_abund_mat_filtered <- sp_abund_mat_filtered[,sort(colnames(sp_abund_mat_filtered))]


## -------------------------------------------------------------------
env_info_filtered <- env_info[fil_comp,]


## -------------------------------------------------------------------
sp_01_filtered <- sp_abund_mat_filtered
mode(sp_01_filtered) <- "logical"


## -------------------------------------------------------------------
(riqueza <- rowSums(sp_01_filtered))


## -------------------------------------------------------------------
(acid5pc <- quantile(env_info_filtered$PH,0.05))
(alka5pc <- quantile(env_info_filtered$PH,0.95))


## -------------------------------------------------------------------
(riq_acid <- riqueza[env_info_filtered$PH <= acid5pc])
(riq_alka <- riqueza[env_info_filtered$PH >= alka5pc])


## -------------------------------------------------------------------
save(list=c("sp_abund_mat_filtered","riq_acid","riq_alka"), file = paste0(fol_Results,"filteredDiatoms.RData"))


## -------------------------------------------------------------------
# Ejercicio 2 sobre la lectura de archivos complejos ----
require(openxlsx)
fFF <- loadWorkbook(paste0(fol_Datos,"fitosociologiaFagusFrancia.xlsx"))
(sheetNames<-names(fFF))


## -------------------------------------------------------------------
rawList<-list()
rawList$Lapraz1<- read.xlsx(fFF,sheet=sheetNames[1],colNames = F, rowNames = F, skipEmptyRows=T, skipEmptyCols = T)
rawList$Lapraz2<- read.xlsx(fFF,sheet=sheetNames[2],colNames = F, rowNames = F, skipEmptyRows=T, skipEmptyCols = T)



## -------------------------------------------------------------------
rawList[[1]]<-rawList[[1]][,-ncol(rawList[[1]])]
rawList[[2]]<-rawList[[2]][,-ncol(rawList[[2]])]


## -------------------------------------------------------------------
(lastRowEnv_1 <- which(rawList[[1]][,1] == "Genre")-1)
(lastRowEnv_2 <- which(rawList[[2]][,1] == "Genre")-1)


## -------------------------------------------------------------------
# Extraer las filas que corresponden, las columnas que tienen un numero de relevé,
# sacar la columna que contiene los nombres de filas, transponer lo extraído y
# pasarlos en formato data.frame
fFF_env_info1 <- data.frame(t(rawList[[1]][1:lastRowEnv_1, !is.na(rawList[[1]][1,])][,-1]))
fFF_env_info2 <- data.frame(t(rawList[[2]][1:lastRowEnv_2, !is.na(rawList[[2]][1,])][,-1]))
# Añadir los colnames
colnames(fFF_env_info1) <- rawList[[1]][1:lastRowEnv_1,1] 
colnames(fFF_env_info2) <- rawList[[2]][1:lastRowEnv_2,1] 


## -------------------------------------------------------------------
fFF_env_info1$`Taux de carbonates`[fFF_env_info1$`Taux de carbonates` == "Traces"] <- 0
fFF_env_info1 <- type.convert(fFF_env_info1,as.is=T)
fFF_env_info2 <- type.convert(fFF_env_info2,as.is=T)


## -------------------------------------------------------------------
fFF_env_info1$cd_rel <- paste("LZ1_",fFF_env_info1$`Numéros des relevés`,sep="")
fFF_env_info2$cd_rel <- paste("LZ2_",fFF_env_info2$`Numéros des relevés`,sep="")


## -------------------------------------------------------------------
# Cuales son todos los nombres de columnas
totCol <- union(colnames(fFF_env_info1),colnames(fFF_env_info2))
# Cuales las columnas que faltan en la tabla1
(missingCol1 <- totCol[! totCol %in% colnames(fFF_env_info1)])
# Cuales las columnas que faltan en la tabla2
(missingCol2 <- totCol[! totCol %in% colnames(fFF_env_info2)])
# Crear las columnas faltantes y llenarlas de NA
fFF_env_info1[,missingCol1]<-NA
fFF_env_info2[,missingCol2]<-NA
# Hacer que las columnas de las dos tablas tengan el mismo orden
fFF_env_info1<-fFF_env_info1[totCol]
fFF_env_info2<-fFF_env_info2[totCol]


## -------------------------------------------------------------------
fFF_env_info<-rbind(fFF_env_info1, fFF_env_info2)


## -------------------------------------------------------------------
raw_mat1 <- as.matrix(t(rawList[[1]][(lastRowEnv_1+2):nrow(rawList[[1]]), 3:ncol(rawList[[1]])]))
raw_mat2 <- as.matrix(t(rawList[[2]][(lastRowEnv_2+2):nrow(rawList[[2]]), 3:ncol(rawList[[2]])]))


## -------------------------------------------------------------------
(tax1 <- paste(
  rawList[[1]][(lastRowEnv_1+2):nrow(rawList[[1]]),1],
  rawList[[1]][(lastRowEnv_1+2):nrow(rawList[[1]]),2]
))[1:10]
(tax2 <- paste(
  rawList[[2]][(lastRowEnv_2+2):nrow(rawList[[2]]),1],
  rawList[[2]][(lastRowEnv_2+2):nrow(rawList[[2]]),2]
))[1:10]
# Los pongamos como nombre de columnas
colnames(raw_mat1) <- tax1
colnames(raw_mat2) <- tax2


## -------------------------------------------------------------------
rownames(raw_mat1) <- fFF_env_info1$cd_rel
rownames(raw_mat2) <- fFF_env_info2$cd_rel


## -------------------------------------------------------------------
# Lista completa de especies
totSp <- union(colnames(raw_mat1), colnames(raw_mat2))
# especies faltantes en cada matriz
missingSpMat1 <- totSp[! totSp %in% colnames(raw_mat1)]
missingSpMat2 <- totSp[! totSp %in% colnames(raw_mat2)]
# crear las matrices de NA con las especies faltantes.
# Anotar: el argumento dimnames tiene que ser una lista: el primer elemento contiene los
# nombres de filas, el segundo los nombres de columnas
matSupp1 <- matrix(NA, nrow=nrow(raw_mat1), ncol=length(missingSpMat1), 
                   dimnames=list(rownames(raw_mat1), missingSpMat1))
matSupp2 <- matrix(NA, nrow=nrow(raw_mat2), ncol=length(missingSpMat2), 
                   dimnames=list(rownames(raw_mat2), missingSpMat2))
# Ahora pegamos por columna esas matrices a las matrices originales
raw_mat1 <- cbind(raw_mat1, matSupp1)
raw_mat2 <- cbind(raw_mat2, matSupp2)
#Ponemos las columnas en el mismo orden en las 2 matrices
raw_mat1 <- raw_mat1[,totSp]
raw_mat2 <- raw_mat2[,totSp]


## -------------------------------------------------------------------
raw_mat <- rbind(raw_mat1, raw_mat2)


## -------------------------------------------------------------------
bbScale <-data.frame(
  code=c("r","+",as.character(1:5)),
  description= c("Menos del 1% de cobertura, 3-5 individuos", "Menos del 5% de cobertura, pocos individuos","~5% más individuos","5%-25%","25%-50%","50%-75%","75%-100%"),
  minPercent=c(0,1,5,5,25,50,75),
  maxPercent=c(1,5,5,25,50,75,100)
)
bbScale$finalVal <- (bbScale$minPercent+bbScale$maxPercent)/2


## -------------------------------------------------------------------
m_raw_mat_code <- match(raw_mat,bbScale$code)


## -------------------------------------------------------------------
matCobertura <- matrix(bbScale$finalVal[m_raw_mat_code],nrow=nrow(raw_mat),ncol=ncol(raw_mat), dimnames=dimnames(raw_mat))


## -------------------------------------------------------------------
matCobertura[is.na(matCobertura)] <- 0


## -------------------------------------------------------------------
# Crear el workbook
wbFinal <- createWorkbook()
# Crear las pestañas
addWorksheet(wbFinal,"Sampling units")
addWorksheet(wbFinal,"Cobertura")
# Poner los datos
writeData(wbFinal,"Sampling units", fFF_env_info, rowNames = F)
writeData(wbFinal,"Cobertura", matCobertura, rowNames = T)
# Exportar el archivo excel
saveWorkbook(wbFinal, file = paste(fol_Results,"fitosociologíaFagusFranciaFinal.xlsx"), overwrite = T)

```{.r .distill-force-highlighting-css}
```
