## -------------------------------------------------------------------
(numeros <- c(3,1,6))


## -------------------------------------------------------------------
length(numeros)


## -------------------------------------------------------------------
names(numeros)<-c("a","b","c")
numeros


## -------------------------------------------------------------------
(matExample <- matrix(letters[1:12],nrow=4,ncol=3))


## -------------------------------------------------------------------
dim(matExample)
nrow(matExample)
ncol(matExample)


## -------------------------------------------------------------------
colnames(matExample)<-c("A","B","C")
rownames(matExample)<-c("fila1","fila2","fila3","fila4")
matExample


## -------------------------------------------------------------------
mode(numeros)
mode(matExample)


## -------------------------------------------------------------------
(vecLog <- c(T,F,F,T,T))
mode(vecLog)


## -------------------------------------------------------------------
(numInt <- c(5L,3L,1L))
is.integer(numInt)
(numOtros <- c(8.1837, 6.94785, 5, 17/9))
is.integer(numOtros)


## -------------------------------------------------------------------
(vecCar <- c("palabras","con espacio", "o numeros 123", "o otras cosa [^"))
mode(vecCar)
nchar(vecCar)


## -------------------------------------------------------------------
(factorExample <- factor(c("Sí","No","Sí","Tal vez"),levels=c("Sí","No","Tal vez")))
mode(factorExample)


## -------------------------------------------------------------------
as.numeric(factorExample)


## -------------------------------------------------------------------
(vecTestMode <- c(T, 1L, 4.14, "palabra"))
mode(vecTestMode)


## -------------------------------------------------------------------
(list1 <- list(numeros, matExample))


## -------------------------------------------------------------------
(list1_withNames <- list(numeros=numeros, `Un ejemplo de matriz`=matExample))


## -------------------------------------------------------------------
(DF_example <- data.frame(
  country=c("Chile","Colombia","Francia"),
  surAmerica=c(T,T,F),
  superficie_km2=c(756626,1142000,549134)
))


## ----echo=F---------------------------------------------------------
objetos<-data.frame(
  vector=c(T,T,T,F),
  array=c(F,T,F,T),
  `modo único`=c(T,T,F,F),
  list=c(F,F,T,T)
)
rownames(objetos) <- c("vector","matriz","list","data.frame")
kbl(objetos,booktabs=T, label="clases" ,caption="Tipos principales de objetos, y sus caracteristicas heredadas. La columna modo unico indica si el objeto solo puede contenir datos de un modo (ver noción de *atomic mode*).")


## -------------------------------------------------------------------
length(matExample)
nrow(matExample)


## -------------------------------------------------------------------
numeros
numeros[c(T,F,T)]


## -------------------------------------------------------------------
factorExample
factorExample[c(F, T)]


## -------------------------------------------------------------------
(mul3 <- (1:100)[c(F, F, T)])


## -------------------------------------------------------------------
numeros >= 2
numeros[numeros >= 2]
numeros[numeros >= 2 & numeros != 6]
numeros[!(numeros >= 2 & numeros != 6)]


## -------------------------------------------------------------------
numeros[2:3]


## -------------------------------------------------------------------
numeros[length(numeros):1]


## -------------------------------------------------------------------
numeros[c(1:3,2)]


## -------------------------------------------------------------------
numeros[c("a","c")]


## -------------------------------------------------------------------
matExample
matExample[c(T,T,F,T)]


## -------------------------------------------------------------------
list1_withNames["numeros"]


## -------------------------------------------------------------------
matExample
matExample[2:3,c(T,F,T)]


## -------------------------------------------------------------------
DF_example
DF_example[,"surAmerica"]
DF_example[DF_example[,"surAmerica"],]


## -------------------------------------------------------------------
list1_withNames$numeros


## -------------------------------------------------------------------
list1_withNames$`Un ejemplo de matriz`


## -------------------------------------------------------------------
list1_withNames[[1]]
list1_withNames[["Un ejemplo de matriz"]]


## -------------------------------------------------------------------
list1_withNames[1]
is.list(list1_withNames[1])
list1_withNames[[1]]
is.list(list1_withNames[[1]])


## -------------------------------------------------------------------
DF_example[["country"]]
DF_example[DF_example$surAmerica,]$superficie_km2


## -------------------------------------------------------------------
numeros
numeros["b"] <- 12
numeros

```{.r .distill-force-highlighting-css}
```
