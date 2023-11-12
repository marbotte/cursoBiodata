## -------------------------------------------------------------------
for (i in 1:10)
{
  if(i%%2 ==0){cat(i,"es un número par\n")}else{print(i)}
}


## -------------------------------------------------------------------
res<-1
while(res<10){
  add<-sample(c(1,2,3),1)
  res<-res+add
  cat("yo añado",add,"ahora 'res' vale",res,"\n")
}


## -------------------------------------------------------------------
(load("../Datos/bog_chinga.RData"))
mat_bog_chinga
apply(mat_bog_chinga,1,mean)


## -------------------------------------------------------------------
apply(mat_bog_chinga,2,mean)


## -------------------------------------------------------------------
apply(mat_bog_chinga,1,mean,simplify = F)


## -------------------------------------------------------------------
apply(mat_bog_chinga,1,function(x,a)toupper(a[which.max(x)]),a=colnames(mat_bog_chinga))


## -------------------------------------------------------------------
require(openxlsx)
cursoWB<-loadWorkbook("../Datos/Curso.xlsx")
contenidoPestañas <- lapply(names(cursoWB), read.xlsx, xlsxFile = cursoWB)
lapply(contenidoPestañas,dim)
sapply(contenidoPestañas,dim)



## -------------------------------------------------------------------
(totalRowCol<- Reduce(`+`,lapply(contenidoPestañas,dim)))
(totalRowCol<- Reduce(`rbind`,lapply(contenidoPestañas,dim)))



## -------------------------------------------------------------------
(valores <- 1:5)
(grupos <- as.factor(c(rep("A",3),rep("B",2))))
tapply(valores,grupos,sum)


## -------------------------------------------------------------------
(misViajes <- data.frame(pais=c("Francia","Colombia","Colombia","Chile"),
                        año=c(2021,2003,2004,2023)))
by(misViajes,misViajes$pais,function(x) paste(nrow(x),"viajes:",paste(x$año,sep="",collapse=", ")))


## -------------------------------------------------------------------
create_list_metaData<-function(date=Sys.Date(),tipoOrganismos,lugar="Concepción, Chile")
{
  return(list(date=date,tipoOrganismos=tipoOrganismos,lugar=lugar))
}
create_list_metaData(tipoOrganismos = "Plantas")
create_list_metaData(date=Sys.Date()+1, tipoOrganismos = "Animales")



## -------------------------------------------------------------------
max_mas1<-function(x,...)
{
  a<-max(x,...)
  return(a+1)
}

max_mas1(c(6,7,9))
max_mas1(c(6,7,9,NA))
max_mas1(c(6,7,9,NA),na.rm=T)



```{.r .distill-force-highlighting-css}
```
