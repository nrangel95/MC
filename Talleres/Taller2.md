#Taller 2
*Métodos Computacionales - Laboratorio*

03-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller2/. 
No olvide al final hacer un *commit* y un *push*.

## Lotería

1. Escriba  un script de `bash` llamado `loteria.sh` que determine si su taller es afortunado y va a ser revisado. 
La información necesaria siempre va a estar en el momento adecuado en el archivo 
[lottery](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv). Además de imprimir si el taller va a ser o no revisado también se debe imprimir la primera línea del archivo `csv` que tiene la fecha. Guárdelo en la carpeta de ejecutables de su computador.

**Solución** 

Descargar automáticamente el archivo csv, buscar mi código e imprimir si será revisado o no mi taller. 

```
wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/lottery/lottery.csv


head -1 lottery.csv
awk -F"," '{if($1==201327421) print $2}' lottery.csv


rm lottery.csv

```

---


## Expresiones Regulares

1. Descargue el [archivo](http://www.minhacienda.gov.co/portal/page/portal/HomeMinhacienda/presupuestogeneraldelanacion/ProyectoPGN/2015/Presentacion%20Proyecto%202015.pdf) del Ministerio de Hacienda con información sobre el Presupuesto General de la Nación 2015. Abra el archivo, diríjase a la página 10, haga *copy-paste* los datos de la tabla comenzando en *EDUCACIÓN* y terminando en *100,0*, guárdelos en un archivo llamado `pgn.dat`. Escriba comandos de `sed` que lleven a cabo las siguientes tareas de búsqueda y reemplazo y aplíquelos secuencialmente sobre el archivo `pgn.dat`: 

	* eliminar todos los puntos,

	* cambiar por puntos todas las comas que estén seguidas de algún dígito,

	* cambiar por `tab` todos los espacios en blanco que estén seguidos de algún dígito o por (,

	* eliminar todos los paréntesis derechos,

	* y por último cambiar todos los paréntesis izquierdos por -. El resultado final debe quedar guardado en el archivo `pgn.tsv`.

	* Finalmente usar `sort --field-separator=$'\t' ...`  y `head` para organizar el archivo de acuerdo al cambio porcentual y encontrar el sector con el menor cambio porcentual.
	
	**Solución Punto 2** *El script fue realizado según el orden de las instrucciones mencionadas anteriormente*
	
	``` 
	#!/bin/bash

wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller2/pgn.dat

sed -i.bak 's/\.//g' pgn.dat
sed -E -i.bak 's/,([0-9])/.\1/g' pgn.dat
sed -E -i.bak 's/ (\()/	\1/g' pgn.dat
sed -E -i.bak 's/ ([0-9])/	\1/g' pgn.dat
sed -E -i.bak 's/\)//g' pgn.dat
sed -E 's/\(/-/g' pgn.dat >> pgn.tsv


sort -n --key=4 --field-separator=$'\t' pgn.tsv >> pgn1.tsv

printf "%s\n" "El sector con menor cambio porcentual es: "

awk '{print $1}' pgn1.tsv >> Sectores.tsv


head -1 Sectores.tsv


#Eliminar archivos temporales.
rm pgn.dat

rm pgn.tsv

rm pgn1.tsv

rm Sectores.tsv
 ```
	
	
---
	

## gnuplot

1. Haga con [Saturno](http://nssdc.gsfc.nasa.gov/planetary/factsheet/saturniansatfact.html) lo mismo que hicimos con Júpiter: limpiar el archivo llevándolo a formato `csv` y hacer una gráfica con `gnuplot` que evalúe la tercera ley de Kepler. Hay que tener especial cuidado con la columna para el periodo de rotación.

Para la primera parte, el archivo se "limpió" recurriendo al editor de texto TextWrangler. En este programa se realizaron varios reemplazos, por ejemplos cambiando los tabs por comas, siguiendo las convenciones que están registradas en mi journal en la clase del 2 de Junio. Una vez, el archivo .csv está listo para ser utilizado para la gráfica entramos a la plataforma de Gnuplot en la terminal. 

Ya en la terminal se nos pedía comprobar la tercera ley de Kepler que enuncia que el cuadrado del periodo orbital de un cuerpo es porporcional al cubo de su semi-eje mayor. Para realizar esto, utilicé el siguiente código.


```
gnuplot

set title "Tercera Ley de Kepler"

set xlabel "Cuadrado del Periodo"

set ylabel "Eje Mayor al Cubo"

quad(x) = x**2
cube(x) = x**3

set datafile separator "," 

plot "Saturno.csv" using (quad($4)):(cube($2))

```

*Nota: Considero que los comandos son muy dicientes, razón por la cual no los comenté.*
