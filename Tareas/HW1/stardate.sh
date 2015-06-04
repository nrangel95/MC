#!/bin/bash


rm Eventos.txt
#Descargamos archivos de interés

wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/hyg.csv

wget https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionales/master/homework/2015-V/HW1/worldhistory.tsv

#Busco el año que me ha entrado como parámetro en el archivo.

grep $1 worldhistory.tsv >> EventosHist.tsv

#Elimino el año que precede a los eventos.
sed 's/	//g' EventosHist.tsv >> Eventos1.txt
sed 's/[0-9]//g' Eventos1.txt >> Eventos.txt

#Acá Empezaré la parte de las estrellas

limInferior=$((2015-$1))
limSuperior=$((2016-$1))

awk -F"," -v limI=$limInferior -v limS=$limSuperior '{if($10>limI &&  $10<limS) print $8, $9}' hyg.csv >> estrellasEncontradas.csv




echo \################################################################################
figlet StarDate
echo \################################################################################
figlet $1
echo -----------------------------------------
cat Eventos.txt
echo \################################################################################
echo LOOK AT THESE STARS \(THEIR LIGHT HAS BEEN TRAVELLING SICE $1\):
echo  -- RA  ----  DEC --
head -5 estrellasEncontradas.csv

#Eliminar archivos 

rm hyg.csv
rm worldhistory.tsv
rm Eventos.txt
rm EventosHist.tsv
rm Eventos1.txt
rm estrellasEncontradas.csv
