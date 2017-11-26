# dplyr and tidyr workshop

Este repositorio contiene el codigo, ejemplos y ejercicios utilizados durante el seminario de dplyr y tidyr que tuvo lugar en Solsona, el 24 de enero de 2017. El texto para seguir el workshop se puede encontrar [aqu�](R/workshop_exercices.html), y se puede descargar tambi�n como un [pdf](R/workshop_exercices.pdf)

## Contenido
El workshop cubre las principales funciones de los paquetes [dplyr](dplyr.tidyverse.org) y [tidyr](tidyr.tidyverse.org), ambos inclu�dos en el `tidyverse`, desarrollado por Hadley Wickham. Dichas funciones incluyen verbos como `mutate`, `summarise`, `select` o `filter`, as� como la transformaci�n de los datos de acuerdo al principio del `tidy data`, usando verbos como `gather`y `spread`. Finalment, tambi� cubre las distintas opciones de uni�n de dos tablas mediante `join`, e introduce algunas otras funciones m�s avanzadas de los paquetes `dplyr`,`tidyr`y `purrr`. Para m�s informaci�n sobre dichos paquetes y sus funciones, se recomienda consultar [R for data science](http://r4ds.had.co.nz/), de Hadley Wickham, o la p�gina web del `tidyverse`.

## Dependencias
Para poder seguir el seminario es necesario tener instalados los paquetes `tidyr`y `dplyr` as� como el paquete `maps`. Si no los tenemos podemos hacerlo mediante la siguiente instrucci�n

```
install.packages("tidyr")
install.packages("dplyr")
install.packages("maps")
```

## Licencia
Los datos necesarios para seguir el seminario (disponibles [aqu�](https://github.com/ameztegui/dplyr_workshop/tree/master/data)) se descargaron del Tercer Inventario Forestal Nacional espa�ol (3IFN). Todos los datos, c�digo y documentos asociados est�n bajo una licencia MIT, lo cual permite cualquier uso, distribuci�n o modificaci�n, siempre que se mencione la autor�a. Los detalles pueden consultarse en el archivo [LICENSE.txt](LICENSE.txt). 

## Atribuci�n y contacto
Si utilizas o modificas el material contenido en este repositorio, c�talo adecuadamente como:

```
Aitor Ameztegui (2017) dplyr and tidyr workshop: Data science with the tidyverse. 
GitHub repository, https://github.com/ameztegui/dplyr_workshop
```
Puedes encontrar m�s detalles en el archivo [CITATION.txt](CITATION.txt)
Para cualquier uso que trascienda dicha licencia o cualquier aclaraci�n, contactar con Aitor Ameztegui (ameztegui@gmail.com).

