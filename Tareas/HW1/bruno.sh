#!/bin/bash 

#Punto 2.A)


wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/kepler.csv

#Debemos imprimir la cantidad de planetas que están registrados en el catálogo, esto quiere decir dar el número total de líneas restándole la línea correspondiente al encabezado. Aunque primero designaré el delimitador entre columnas usando awk.


VarTemporal=$(wc -l kepler.csv | sed 's/kepler.csv//g')

#Le estoy agregando el sed ya que el wordcount me está imprimiendo el nombre del archivo al que le está contando el número de líneas. 

echo El número de estrellas es: $(($VarTemporal-1))

#Debemos hacer esta resta para no considerar la línea que corresponde al encabezado. 

#Punto 2.B)

#Primero se debe reemplazar todos los espacios vacíos con algún otro carácter para poder procesarlo con awk, y designar la coma como el delimitador entre columnas.

sed 's/KOI /KOI-/g' kepler.csv > keplerEdit.csv

#Este método lo implementé para no tener problemas con los nombres que involucran espacios. 


awk -F"," '{if($2>=0 &&  $2<0.01) print $1}' keplerEdit.csv >> planetasLivianos.txt


planetasLiv=$(wc -l planetasLivianos.txt | sed 's/planetasLivianos.txt//g')

echo El número de planetas más livianos que una centésima de la masa de Jupiter son $planetasLiv, y son los siguientes: 

cat planetasLivianos.txt


#Punto 2C) 

cut -d"," -f 6 keplerEdit.csv >> periodosOrbitales.txt

# -d"," designa el delimitador entre columnas
# -f 6 representa cual es la columna que se va a seleccionar

sort -n periodosOrbitales.txt >> periodosOrbitales1.txt

(head -2 periodosOrbitales1.txt |tail -1) >> periodoPlanetaMasRapido.txt

periodo1=$(cat periodoPlanetaMasRapido.txt)

grep $periodo1 keplerEdit.csv >> 1.csv

awk -F"," '{print $1}' 1.csv >> planeta1.txt

planetaa=$(cat planeta1.txt)


echo El planeta con menor periodo orbital es: $planetaa  y tiene un periodo de $periodo1



#Para terminar, Eliminar archivos temporales
rm kepler.csv
rm keplerEdit.csv
rm planetasLivianos.txt
rm periodosOrbitales.txt
rm periodosOrbitales1.txt
rm periodoPlanetaMasRapido.txt
rm 1.csv
rm planeta1.txt
