## -------------------------------------------------------------------
fol_Datos <- "../Datos/"
fol_Results <- "../Resultados/"


## -------------------------------------------------------------------
(load(paste0(fol_Datos,"diatomeas.RData")))


## -------------------------------------------------------------------
nrow(sp_abund_mat)
length(reference_sites)
nrow(env_info)
nrow(coord_x_y)


## -------------------------------------------------------------------
barplot(table(env_info$HER1Lyon),cex.names=.65,xlab="Hydro-Eco-Región de nivel 1",ylab="Número de muestreos")


## -------------------------------------------------------------------
hist(env_info$PH,main="",xlab="pH")


## -------------------------------------------------------------------
(load(paste0(fol_Datos, "diatomTaxonomy.RData")))


## -------------------------------------------------------------------
str(taxonomy)


## -------------------------------------------------------------------
bbScale <-data.frame(
  code=c("r","+",as.character(1:5)),
  description= c("Menos del 1% de cobertura, 3-5 individuos", "Menos del 5% de cobertura, pocos individuos","~5% más individuos","5%-25%","25%-50%","50%-75%","75%-100%"),
  minPercent=c(0,1,5,5,25,50,75),
  maxPercent=c(1,5,5,25,50,75,100)
)
bbScale$finalVal <- (bbScale$minPercent+bbScale$maxPercent)/2





## -------------------------------------------------------------------
df_bog_chinga <- data.frame(
  UniMuestreo=c(rep("Bogotá",2),rep("Chingaza",3)),
  Especie=c("Canis lupus","Felis catus","Tremarctos ornatus","Canis lupus","Odocoileus virginianus"),
  abundancia=c(3000,1000,50,100,200)
)
mat_bog_chinga <- matrix(c(3000,100,1000,0,0,50,0,200),nrow=2,dimnames=list(c("Bogotá","Chingaza"),c("Canis lupus","Felis catus","Tramarctos ornatus","Odocoileus viginianus")))

```{.r .distill-force-highlighting-css}
```
