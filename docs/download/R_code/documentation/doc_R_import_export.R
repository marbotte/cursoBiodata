## -------------------------------------------------------------------
getwd()


## -------------------------------------------------------------------
setwd("/home/marius")


## -------------------------------------------------------------------
dir()


## -------------------------------------------------------------------
readLines("../Datos/bog_chinga.csv")


## -------------------------------------------------------------------
read.csv("../Datos/bog_chinga.csv")


## -------------------------------------------------------------------
miTexto<-c("Hello world","Me llamo Marius","y estoy escribiendo un texto en R")
writeLines(miTexto, con="../Resultados/miTexto.txt")


## -------------------------------------------------------------------
(letras_numeros<-data.frame(letras=LETTERS,numeros=1:length(LETTERS)))
write.csv(letras_numeros,file="../Resultados/let_num.csv")


## -------------------------------------------------------------------
library(openxlsx)
(programa<-read.xlsx("../Datos/Curso.xlsx",sheet="programa"))


## -------------------------------------------------------------------
wbCurso <- loadWorkbook("../Datos/Curso.xlsx")


## -------------------------------------------------------------------
names(wbCurso)


## -------------------------------------------------------------------
(estudiantes<-read.xlsx(wbCurso,sheet="estudiantes",colNames=F))


## -------------------------------------------------------------------
mi_xlsx<-createWorkbook()
addWorksheet(mi_xlsx,"programa")
addWorksheet(mi_xlsx,"estudiantes")
addWorksheet(mi_xlsx,"num_estudiantes")


## -------------------------------------------------------------------
writeData(mi_xlsx,"programa",programa,rowNames = F)
writeData(mi_xlsx,"estudiantes",estudiantes,rowNames = F)
num_estu<-length(estudiantes)
writeData(mi_xlsx,"num_estudiantes",num_estu,rowNames = F)


## -------------------------------------------------------------------
saveWorkbook(mi_xlsx,file="../Resultados/mi_xlsx", overwrite = T)


## -------------------------------------------------------------------
save(list=c("programa","estudiantes"),file="../Resultados/cursoBiodata.RData")


## -------------------------------------------------------------------
(load(file="../Resultados/cursoBiodata.RData"))


## -------------------------------------------------------------------
saveRDS(object=num_estu,file="../Resultados/nbStud.rds")


## -------------------------------------------------------------------
nbStud<-readRDS("../Resultados/nbStud.rds")
nbStud==num_estu

```{.r .distill-force-highlighting-css}
```
