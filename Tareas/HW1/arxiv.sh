#!/bin/bash

#Obtener código fuente de la página (Superconductividad es mi tema)

curl http://arxiv.org/list/supr-con/new >> codigoArxiv.txt

#Buscar las partes del código donde se registra el título de los archivos.

grep Title codigoArxiv.txt >> Titulos.txt

sed -i.bak 's/\$.*\$//g' Titulos.txt

#Buscar patrones que coincidad EXACTAMENTE con la palabra que entra como parámetro. 

grep -i -w $1 Titulos.txt >> encontrados.txt

#Eliminar el string que no me incumbe y hacerlo coincidir con la presentación que se nos pide.

sed 's/\<span\ class="descriptor">Title:<\/span>\ //g' encontrados.txt >> encontradosEdit.txt

sed -i.bak 's/</- /g' encontradosEdit.txt

numEncontrados=$(wc -l encontradosEdit.txt | sed 's/encontradosEdit.txt//g')

#------------- PRESENTACIÓN 

figlet      arXiv

echo ==========================================
echo Searching the arXiv for the new stuff
echo http://arxiv.org/list/supr-con/new
echo =========================================
echo KEYWORD: $1
echo =========================================
echo Articles found: $numEncontrados
cat encontradosEdit.txt



#Eliminar archivos temporales

rm codigoArxiv.txt
rm Titulos.txt
rm encontrados.txt
rm encontradosEdit.txt
rm encontradosEdit.txt.bak 
rm Titulos.txt.bak
