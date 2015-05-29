## 29 de Mayo del 2015. 8:45 a.m.

#### Primer Punto: Escriba en Markdown un documento con una sección, dos subsecciones, una lista numerada, una lista sin numerar, un link, y un trozo de código inline y otro en bloque. Ver: Markdown cheatsheet.

# Sección 1 (Compras en el supermercado)
## Subsección 1.1 (Lista de Mercado)

#### Verduras
* Lechuga
* Remolacha
* Coliflor
* Pepino

#### Frutas
1. Mandarinas 
2. Manzanas
3. Bananos
4. Ciruelas



## Subsección 1.2 (Tecnología)

- Comprar este computador (http://www.alkosto.com/convertible-2-en-1-asus-t100taf-negro)
- Descargar Bash e introducirle el siguiente código: `import numpy as np`
- Si no funciona introduzca lo siguiente: 
``` 
%pylab inline
import numpy as np
print "s"

```
--- 

#### Segundo Punto: Escriba un script de bash que produzca un archivo csv con los primeros mil números enteros junto con sus cuadrados. Para hacer la aritmética utilice The Double-Parentheses Construct.

```
for i in {1..1000}

do 
echo $i, $((i*i)) >> SegundoPunto.csv
done
```

---

#### Tercer Punto: Escriba el código a usar en awk para sumar las columnas 1 y 2 de un archivo csv. Use el resultado del anterior ejercicio para hacer pruebas.

awk -F"," '{ print (($1+$2)) }' SegundoPunto.csv 

###### Y si lo queremos guardar en otro archivo .csv, se haría lo siguiente:

awk -F"," '{ print (($1+$2)) }' SegundoPunto.csv >> TercerPunto.csv

---

#### Cuarto Punto: Escriba un script de bash que reciba dos números naturales y entregue de regreso su suma.

```
#!/bin/bash

echo $(($1+$2))
```

##### Nota: Cabe resaltar que al ejecutarlo debemos introducir dos números naturales como parámetros.

---

#### Quinto Punto: Escriba un reloj en bash que utilice date, figlet, sleep, while y clear.
