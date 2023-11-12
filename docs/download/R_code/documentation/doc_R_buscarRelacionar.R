## -------------------------------------------------------------------
which(c(T,F,F,T))


## -------------------------------------------------------------------
vecLeyNormal <- rnorm(1000, mean = 0, sd = 1)
(sup3 <- which(vecLeyNormal > 3))
vecLeyNormal[sup3]


## -------------------------------------------------------------------
load("../Datos/bog_chinga.RData")
mat_bog_chinga


## -------------------------------------------------------------------
(sup0 <- which(mat_bog_chinga > 0, arr.ind = T))
mat_bog_chinga[sup0]


## -------------------------------------------------------------------
var <- c("A","A","b","B","Z","E","I")
LETTERS

m_var_LET<-match(var,LETTERS)
LETTERS[m_var_LET]

```{.r .distill-force-highlighting-css}
```
