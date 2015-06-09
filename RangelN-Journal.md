#Bitácora del curso de Métodos Computacionales 2015-V

##27 de Mayo del 2015

**Herramientas del curso:**

- Git
- GitHub 
- Bash
- C
- Python 

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

--- 
##2 de Junio, 2015

###Expresiones Regulares

Entiéndase una expresión regular (también llamadas regex o patrones) como "una cadena de caracteres que describe un conjunto de cadenas de caracteres sin enumerar sus elementos."

Existen algunos símbolos que es importante conocer cuando se tratan expresiones regulares: 

Símbolo | Significado
--------|-----------
^       | Inicio de línea
  .     |  Cualquier caracter
$       | Al final de la línea
.*      | Cualquier caracter con 0 o más ocurrencias
.+      | Cualquier caracter con 1 o más ocurrencias
 a \| b | a ó b
 \d     | Todos los caracteres que son dígitos
 \D     | Todos los caracteres que no son dígitos
 [a-b]  | Rango de números o letras
 
*Nota:* Se debe usar backslash (\ ) para denotar caracteres especiales. 

###Gnuplot

Gnuplot es un programa que puede ser accesado desde la terminal que nos permite realizar distintas gráficas. 

En caso de necesitarse, se debe acomodar los rangos de los ejes de la siguiente manera `[a:b]`. Primero, se establece el rango para el eje X y luego el eje Y. Ejemplo: `gnuplot [0:2*pi] [-1:1] sin(x)`

También se explicó que es posible establecer los rótulos de los ejes, el título de la gráfica y otras propiedades de la tabla recuerriendo a distintos comandos para `set`. (Ver manual) Ejemplo: `set xlabel "tiempo"`

Por último, se mencionó que es posible utilizar gnupot para graficar datos presentes en otros archivos. 
Ejemplo: `plot "archivo.csv" using 2:3 ` (Donde las columnas 2 y 3 del archivo archivo.csv serán los valores para X y Y, respectivamente. 



###Hands-on

**Primer Punto (log)** 

Si queremos generar un match para 4 caracteres cualquiera que estén ubicados al comienzo de una línea, seguidos de un espacio, la expresión regular sería la siguiente: `^.... ` 

De esto debemos recordar que `^` simboliza que el patrón debe estar al comienzo de una línea, `.` representa cualquier caracter y que el espacio se simboliza de la misma manera.

**Segundo Punto**

Una vez se copió todo el texto correspondiente a la tabla de eventos modernos, recurriendo a los reemplazos de sed fue posible acomodar todo el texto en dos columnas separadas por un tab. Y luego cambiamos el formato por un .tsv

**Tercer Punto (log)**

10 MILLONES DE DÍGITOS DE PI

Lo primero que hice fue descargar el contenido de la página de internet con `curl` desde la terminal. 
Luego lo copié en un editor de texto, en este caso TextWrangler. 

Una vez en el editor de texto se dividió la secuencia de dígitos en grupos de 20 usando lo siguiente:

```

Buscar: (....................)

Reemplazar: \1\n

```

El abrazar entre parentésis los 20 puntos, agrupa los 20 caracteres en un grupo. Grupo que es posteriormente invocado en la parte de reemplazar con el \1. Luego el adicionar el \n introduce una nueva línea separando así el archivo en grupos de 20 dígitos. 

---

##3 de Junio, 2015

En el laboratorio realizamos un taller dónde practicamos el uso de `sed` y Gnuplot.  (Remitirse a Talleres/Taller2) 

En la primera parte, tuvimos que realizar varios reemplazos para convertir un arvhivo .dat en uno .tsv y luego determinar cual fue el sector que tuvo el menor cambio porcentual. 

En la segunda parte, repetimos el ejercicio de la magistral del segundo de Junio, 2015, pero con los datos orbitales de Saturno. 

---

--- 

##5 de Junio, 2015

###LABORATORIO

Durante la sesión, el profesor enseñó de manera breve la manera de ejecutar iteraciones en archivos en Bash, siguiendo el modelo que se presenta a continuación: 

``` 
for file in $(ls)
do 
(Instrucción involucrando $file)
done
```

También se mencionó que es posible filtrar los archivos sobre los cuales quiero hacer las iteraciones agregando condiciones en el "rango". Ejemplo: `for file in $(ls *.c) ` (En este ejemplo las iteraciones se realizarán sobre todos los archivos cuya extensión sea .c  .

###Magistral

Se explicó de manera breve la sintaxis del lenguaje C. 

```
 Imprimir el contenido de la variable.
 
 printf("%d, \n")
 printf(variable1)
```

Luego seguimos on el lenguaje de Python, de este sólo alcanzamos a aprender la manera en la que se introducen datos como parámetros. 

```
entrada=raw_input("Introduzca un número") #Este comando recibe un parámetro del usuario y lo guarda en una variable. 
```


---

##9 de Junio, 2015

###MAGISTRAL

Lo primero que hicimos al llegar a clase fue abrir un notebook en iPython y ver que tipo de estilos podemos implementar en nuestras gráficas. 

Luego, Juan demostró una manera de solucionar el problema de los 3 cuerpos en Matplotlib. 

####Hands-On

**MAKE** 

Make fue inventado para poder manejar grupos grandes de archivos dependientes entre sí u otros grupos. Con Make podemos actualizar automáticamente grupos de archivos, analizarlos y dar respuesta a problemas informáticos.

Un ejemplo de un grupo de archivos que dependen de otro está representado en la Imagen 1. 

![Image 1](http://software-carpentry.org/v4/make/rules/003.png "Dependencias")
Imagen 1.



*Reglas* 

Como la idea de MAKE es ser eficiente en el manejo de muchos archivos, existen reglas que nos permiten evitar las redundancias en la línea de código para acelerar el proceso. 

En este caso, en vez de escirbir esto: (Lo cual significa que los archivos de la izquierda dependen de los de la derecha) 

``` 
figure-1.csv : data1.dat
figure-2.csv : data2.dat
figure-3.csv : data3.dat
```

Podemos recurrir a una regla de patrón común para resumir esas tres líneas en una sola.

```
figure-%.csv : data%.dat
```

En este caso el % actua como un *wildcard* el cual debe asumir el mismo valor a los dos lados de los dos puntos.

Sin embargo, así Make cree automáticamente los archivos, el usuario debe designar la dependencia que exista entre ellos.  

En últimas, el código que soluciona este problema está registrado en la Imagen 2.

![Image 2](http://software-carpentry.org/v4/make/rules/019.png)
Imagen 2.

 ---
 Existen muchos otros tipos de reglas que no explicaré en este repositorio, pero que pueden ser consultados en esta página sobre [make](http://software-carpentry.org/v4/make/).
 
 
 
 
 
##Proyecto Final 
 
 **9 de Junio, 2015**
 
 Para el proyecto final quiero hacer algo que tenga alguna relación con la carrera que estudio, Geociencias. 
 Aún no sé que hacer con claridad pero, en principio, podría usar software de graficación como Matplotlib y python para realizar diagramas de análisis geoquímico ya que estos son considerablemente complicados de hacer en programas tradicionales como Excel. 
 
 A grandes rasgos, el programa podría funcionar como un script dónde el usuario solo deba introducir como parámetro los valores correspondientes a la composición química de la roca y el programa devuelva a que serie pertenece la roca y qué posible origen tenga. 
 
 




