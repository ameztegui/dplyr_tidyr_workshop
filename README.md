# dplyr and tidyr workshop

Este repositorio contiene el codigo, ejemplos y ejercicios utilizados durante el seminario de dplyr y tidyr que tuvo lugar en Solsona, el 24 de enero de 2017. El texto para seguir el workshop se puede encontrar [aquí](https://github.com/ameztegui/dplyr_workshop/tree/master/R), en html o pdf.

El workshop cubre las principales funciones de los paquetes [dplyr](dplyr.tidyverse.org) y [tidyr](tidyr.tidyverse.org), ambos incluídos en el `tidyverse`, desarrollado por Hadley Wickham. Dichas funciones incluyen verbos como `mutate`, `summarise`, `select` o `filter`, así como la transformación de los datos de acuerdo al principio del `tidy data`, usando verbos como `gather`y `spread`. Finalment, tambié cubre las distintas opciones de unión de dos tablas mediante `join`, e introduce algunas otras funciones más avanzadas de los paquetes `dplyr`,`tidyr`y `purrr`. Para más información sobre dichos paquetes y sus funciones, se recomienda consultar [R for data science](http://r4ds.had.co.nz/), de Hadley Wickham, o la página web del `tidyverse`.

Para poder seguir el seminario es necesario tener instalados los paquetes `tidyr`y `dplyr` así como el paquete `maps`. Si no los tenemos podemos hacerlo mediante la siguiente instrucción

```
install.packages("tidyr")
install.packages("dplyr")
install.packages("maps")
```

Los datos necesarios para seguir el seminario (disponibles [aquí](https://github.com/ameztegui/dplyr_workshop/tree/master/data)) se descargaron del Tercer Inventario Forestal Nacional español (3IFN). Todos los datos, código y documentos asociados están bajo una licencia Creative Commons CC-BY. Para cualquier uso que trascienda dicha licencia o cualquier aclaración, contactar con Aitor Ameztegui (ameztegui@gmail.com).


