#Bitácora del curso de Métodos Computacionales 2015-V

##27 de Mayo del 2015

**Herramientas del curso:**

- +Git
- +GitHub 
- +Bash
- +C
- +Python 

**Los métodos a estudiar son:**

- Interpolación
- Análisis de Fourier
- Diferenciación e Integración
- Ecuaciones Diferenciales
- Montecarlo

Se habló brevemente sobre los comandos relacionados con awk y sed. 

---

Para AWK vimos la manera de imprimir la enésima fila de un archivo (1), establecer el delimitador de columnas es un archivo específico (2), realizar operaciones aritméticas entre columnas (3) y condicionales (4), respresentadas a continuación.

```

1. awk '{print $n}' file1.csv
2. awk -F"," file.csv
3. awk '{print $5 * $10}' file1.csv
4. awk 'if(condición) intrucción'

```
A rasgos generales, el profesor nos explicó como el método curl es utilizado para extraer el código interno de una página de internet.

Si quiero cambiar un elemento (a) por algún otro(b), lo más recomendable es usar sed: `sed 's/a/b/g' `. 

---

Para terminar , el profesor nos enseñó la manera de usar Git superficialmente. 

Lo primero que hicimos fue crear un archivo de tipo RangelN-Journal.md, el cuál fuimos editando durante la clase. En seguida, se realizó una copia del repositorio con git clone, para poder trabajarlo desde la terminal.

Posteriormente se creó un archivo de texto usando como herramienta vi o un editor de texto como emacs. Una vez ahí se hablaron de 4 pasos fundamentales; editar el archivo de texto, adicionar aquello en lo que estuvimos trabajando al archivo (`git add "archivo"`), salvar el trabajo (`git commit`) y, por último, publicar en internet el archivo (`push origin master`).

## 29 de Mayo del 2015

Al llegar al laboratorio, lo primero que hicimos fue desarrollar el Taller 1, dónde practicamos distintos conceptos de MarkDown, bash y awk. (Remitáse al Taller1 en el repository MC).

Posteriormente, a las 11 a.m., cuando comenzó la magistral, creamos una cuenta en SDF (Super Dimension Fortress). En esta comunidad virtual, el profesor nos mostró diferentes tipos de software y aplicativos. 

Luego repasamos distintos comandos básicos y sintáxis de Git, bash y awk. De este ejercicio lo más importantepara recordar es lo siguiente: 

### BASH

**Loops en Bash** 
```
for i in {lim1..lim2}
do
echo $((i**2)) >> newfile.txt  (Ejemplo)
done
```

**Scripts en Bash**

*en el script*
```
#!/bin/bash

echo $1, $2
ó 

echo $(($1 + $2))
```

*en la terminal, para ejecutarlo*
```
./script.sh a b   (Donde a y b son parámetros introducidos por el usuario)
```
**Pasar variable de bash a awk** -->  `awk -v varawk = $varbash

**Asignar un valor aleatorio a una variable** --> `Valor = $(RANDOM%rango)

### Git

Crear el archivo readme
`touch README.md`

Inicializar un Git
`git init`

Añadir el archivo readme al archivo
`git add README.md`

Añadir la versión con su respectivo mensaje
`git commit -m "comentario"`

Subir los cambios realizados al master
`git push -u origin master`

Ver el historial de commits
`git log`

Para recuperar commits perdidos 
`git checkout (hash del commit de interés) `

---

## Último punto del día 

La última actividad del día fue verificar que podemos recuperar commits que hayan sido eliminados; esto lo realizamos haciendo un commit, borrándolo, ingresando al historial de commits y usando el hash encontrado en dicho historial.

El punto B de esta actividad fue desomprimir un archivo y encontrar la fecha del segundo commit realizado.  De esto averiguamos que dicho commit fue el sábado 5 de enero de 2013 a las 19:28:57 y que el tema de la semana 15 en el primer syllabus del curso era el Método de Inferencia Bayesiana.



