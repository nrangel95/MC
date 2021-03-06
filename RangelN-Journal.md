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

### Último punto del día 

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
 
 
 ---
 
##10 de Junio, 2015

###Laboratorio

Durante el laboratorio comenzamos nuestro primer experimento, el objetivo del mismo era comprobar que las rapideces de las partículas en un gas están moduladas por la distribución de Rayleigh. Para hacer esto tuvimos que recurrir a Matplotlib, al graficar tanto la función de Rayleigh como las velocidades de las partículas pudimos comprobar la similitd entre ambos comportamientos. 

###Magistral

Empezamos a hablar sobre las distintas caraterísticas que podemos usar de Matplotlib en nuestros proyectos. 
Juan nos mostró ejemplos de animaciones y gráficas hechas con este programa el cual nos permite variar en gran medida el estilo y funcionalidad de las mismas. 

 **Hands On**
 
 Crear 25 paneles con figuras de Lissajous usando Matplotlib y iPython.
 
 ```
%pylab inline

#Establecer el tamaño de la gráfica. 
figure(figsize=(10,10))

#Delimitar el rango para t.
t=linspace(0, 2*pi, 100)
    
#Para cada iteración creo 3 constantes aleatorias, el subplot generará los 25 paneles que se piden.  
for i in range(0,25):
    A=randint(1,9)
    B=randint(1,9)
    C=randint(1,9)
        
    subplot(5,5,i+1)    
    plot(cos(A*t), sin(B*t+C))
    plt.axis("off")
 
 ```
 El resultado del anterior código se ve así: 
 
 ![alt text](https://cloud.githubusercontent.com/assets/12629060/8174200/cf67a130-13d9-11e5-8df4-57ae84246713.png)
 **Lissajous figures**
 
 
 --- 
 
##15 de Junio, 2015

###Tarea: Apuntes sobre Landau

En el capítulo 2 de *A Survey of Comptational Physics*, escrito por Rubin Landau et al., se habla sobre los errores y las incertidumbes tícipas en la computación. Dejando a un lado la sintaxis, esrte capítulo trataa sobre aquelos problemas generalmente asociados a los algoritmos presentes en los códigos. 

###Tipos de Errores

Tipo de Error | Descripción
-----|------
Teóricos | Relacionados al problema que se pretende resolver con el algoritmo, el código debe ser coherente y estar bien escrito. Este tipo de errores dependen del usario ya que están relacionados al planteamiento del problema.
Aleatorios | Son producto de accidentes o eventos aleatorios que no se pueden controlar. Depende netamente del azar.
Aproximación 1 | Relacionado con aproximaciones teóricos que no hemos considerado como series o                               integrales impropias. Depende del número de iteraciones que puede hacer la máquina.
Aproximación 2 | Tiene que ver con las aproximaciones decimales que realiza el computador por default. Debemos configurar el computador para evitar esto. En principio suelen ser aproximaciones pequeñas pero el aplicarlas consecutivamente afecta considerablemente el resultado. 

El capítulo le presta especial atención a las maneras en las que el usuario puede evitar este tipo de errores. Para cada problema hay que designar un momento para analizar y reducir las diferentes fuentes de error que se presentarán en el código. Generalmente, el aplicar cálculos más intensivos que reemplacen operaciones complicadas, como integrales, factoriales, exponenciales, etc., puede reducir el error notablemente. 

----

##16 de Junio, 2015

**Magistral**

Juan dictó una clase sobre los distintos tipos de interpolaciones que existen. Se habló sobre Lagrange, interpolaciones lineales, cuadráticos, cúbicos, trigonométricos, etc. Revisar `poly1d`(numpy) y `curvefit`(scipy), puede ser de utilidad para hacer este tipo de ajustes.

**Hands-on**
###Notas de como realizar ajustes (Punto1)
```
#Descargar librerias y arvhivos necesarios, luego separar las columnas en abscisas y ordenadas.
%pylab inline
data=genfromtxt("polyunkown.csv", delimiter=",")
poliX=data[:,0]
poliY=data[:,1]

#El polyfit me da los coeficientes que acompañan el polinomio, el tercer parámetro es el grado del polinomio resultante.
coef4=polyfit(poliX, poliY, 4)
coef5=polyfit(poliX, poliY, 5)
coef7=polyfit(poliX, poliY, 7)

#poly1d contruye los polinomios a partir de los coeficientes. 
p5 = poly1d(coef5)
p4 = poly1d(coef4)
p7 = poly1d(coef7)

#Grafico todos los ajustes para determinar cual de todos es el que mejor se adapta al polinomio desconocido. 
scatter(poliX, poliY)
figure(figsize=(10,10))
plot(poliX, p5(poliX), color = "red")
plot(poliX, p4(poliX), color = "green")
plot(poliX, p7(poliX), color = "purple")
show()

```


###Segundo Punto del Hands-On

```
%pylab inline
from scipy.optimize import curve_fit

#Creo los arreglos especificados en el enunciado.
x=[2.3, 2.8, 3.2, 3.7, 4.3]
y=[34745, 19689, 12594, 7982, 5822]

#Tal como lo hicimos en el experimento, se define una función que represente el campo magnético B.
def ajustecampoB(r,m):
    return ((0.2)*m)/(r**3)

#NOTA: No se porque debo primero definir r y luego m, de otra manera el ajuste no funciona.

#Esta parte se encarga de devolver la coeficiente para el mejor ajuste.
fitpars,covmat= curve_fit(ajustecampoB,x,y)

XX=linspace(2, 5, 100)
scatter(x, y, label= "Datos del enunciado")
plot(XX,ajustecampoB(XX, *fitpars), color="green", label="Ajuste del Campo Magnético")
xlabel("Posición en x")
ylabel("Campo Magnético")
legend()
show()

#Interpolar datos
m=2118294.96442 #Dato obtenido del fitpars
def campoB(r):
        return ((0.2)*m)/(r**3)

#Establezco todas las propiedades de la gráfica, consta de los datos del enunciado, el ajuste y los datos interpolados. 
figure=figsize(10,10)
Xinter=linspace(2.3,4.8,100)    
XX=linspace(2, 5, 100)
scatter(x, y, label= "Datos del enunciado")
plot(XX,ajustecampoB(XX, *fitpars), color="green", label="Ajuste del Campo Magnético")
scatter(Xinter, campoB(Xinter), color="red", label="Datos Interpolados")
xlabel("Posición en x")
ylabel("Campo Magnético")
legend()
show()

#Si se necesita una tabla con los datos interpolados. 

print (Xinter, campoB(Xinter))

```

El resultado del ajuste se ve a continuación:
![alt text](https://cloud.githubusercontent.com/assets/12629060/8243510/de430e52-1617-11e5-895d-bc4437101098.png)

###17 de Junio, 2015

**Laboratorio**

Lo más notable sobre el laboratorio fue aprender a manejar interpolaciones (Refer to [Taller4](https://github.com/nrangel95/MC/blob/master/Talleres/Taller4.md). Lo más útil para recordar de esta clase es que siempre que quiera hacer interpolaciones debo importar la siguiente libreria con el siguiente código `from scipy import interpolate`. Esta libreria contiene dos funciones fundamentales: `interpolate.interp1d(x, y, kind='linear')` que le entran como parámetros dos arreglos y el tipo de ajuste de interés y `interpolate.lagrange()` el cual nos devuelve el ajuste polinomial de lagrange. Ambos son muy fáciles de usar. 

**Magistral** 

Juan nos habló más sobre el manejo de ramas en Git. Vimos la manera en la que puede trabajarse en una rama entre dos o más usuarios de Github Ver más sobre esto en el Hands-On. 

Luego vimos el Análisis de Fourier, sirve para analizar imágenes, archivos de audio, filtros, entre otros.
Ciertas operaciones se facilitan mucho usando las transformadas de Fourier. 

###19 de Junio, 2015

En el laboratorio y magistral, se aprendió el manejo básico de realizar un ajuste en el espacio de Fourier.

Lo más importante sobre esta clase fue aprender a manejar las transformadas de Fourier (Refer to [Taller5](https://github.com/nrangel95/MC/blob/master/Talleres/Taller5.md). Acá vemos como aproximamos la función seno usando series de Fourier.

A continuación, se puede ver una onda cudrada obtenida a partir de las series ya mencionadas.

![alt text](https://cloud.githubusercontent.com/assets/12629060/8257523/d469d7f6-1673-11e5-8ac7-79534517698e.png)

Resumen de los códigos usados más importantes:
```
fft(arreglo) #Transformada de fourier discreta de un arreglo de una dimensión.

fft2(arreglo) #Transformada de fourier discreta de un arreglo de dos dimensiones.

fftshift(arreglo) #Cambio de posiciones de las frecuencias que están en cero.
```

###23 de Junio, 2015

**Magistral**

Juan nos habló sobre la manera en la que podemos realizar cálculos numéricos, específicamente hablamos de como podemos calcular derivadas de funciones en python. Se concluyó que la mejor manera de obtener la derivada es con la *central difference* (Ver ecuación correspondiente abajo) ya que el error de esta se propaga con el cuadrado de h y no de manera lineal. sin embargo, para saber más acerca de esto revisar lecture de Numerical Derivatives.

```f′(x)=(f(x+h)−f(x−h))/2h + O(h^2)```

Por último, se habló que hay unas funciones en la libreria de sympy que nos permiten obtener derivadas de manera directa.

**Hands-on**

DFT
Estime la duración del ciclo solar analizando con una DFT los datos monthrg.dat. La descripción del archivo está aquí. Además utilice un filtro de altas frecuencias para obtener una gráfica similar a la mostrada abajo. log

DESARROLLO:
Lo primero fue graficar las medias mensuales de las manchas solares registradas en el último siglo.

``` 
datos=genfromtxt("monthrg.dat")
ano=datos[:,0]

promMes=datos[:,3]

promSigloXX = promMes[3491:4631]
 #Acá estoy cogiendo todos los meses de los años desde 1900 a 1995. (95*12) Y como es el último siglo tomo el último tramo del array.
 
meses=linspace(1900,1995,1140)  #1140 es el nùmero de meses que contienen los años que nos interesan.

figure(figsize=(10,10))
plot(meses,promSigloXX, lw=0.4)
xlim(1900,1995)
ylim(0,250)
xlabel("tiempo (aNos)")
ylabel("Manchas solares")
show()
 
```
![alt text](https://cloud.githubusercontent.com/assets/12629060/8342565/61ee5e6e-1acd-11e5-87f3-b240f65209d2.png)

Lo que se hace a continuación es transformar el array de manchas solares, eliminar las frecuencias altas, invertir la transformación con el array ya limpio, y graficar nuevamente.

```
from scipy.fftpack import ifft, fft, fftfreq
transf=fft(promSigloXX)

N=1140 #Número de meses
dt= 1  #Espaciamiento entre datos.

frec=fftfreq(N, dt) #Obtengo las frecuencias. 

plot(frec,abs(transf))

frecMax=.02
transf[abs(frec)>frecMax] = 0  #En esta lìnea se ejecuta el filtro, se eliminan todas las frecuencias más altas que la establecida por frecMax.


#Plotearé el ciclo solar con ruido (Variaciones a lo largo de los años) y el ciclio limpio que obtuvimos transformando al espacio de fourier 
#y eliminando las frecuencias altas.

figure(figsize=(10,10))
plot(meses,promSigloXX, lw=0.4, c="b")
yLimp=ifft(transf)
plot(meses,yLimp,c="r")
xlim(1900,1995)
ylim(0,250)
xlabel("tiempo (aNos)")
ylabel("Manchas solares")

```

Resultado Final
![alt text](https://cloud.githubusercontent.com/assets/12629060/8342571/6d0ca210-1acd-11e5-96ef-2d6f1f272767.png)


###24 de Junio, 2015

**Laboratorio**

El taller que empezamos hoy y que terminaremos el Viernes, consistió en repasar el concepto del cambio de coordenadas esféricas a coordenadas cartesianas, manejo de matrices y operaciones entre ellas. Ver más sobre esto en **26 de Junio, 2015**

**Magistral**

En la magistral se aprendió el manejo de métodos numéricos para resolver integrales. Estos tienen la ventaja de que no son tan pesados para los computadores y son notablemente precisos. Se prestó especial atención a las reglas de Simpson y los polinomios de Legendre y Lagrange.


###1 de Julio, 2015

**Laboratorio** 

En el laboratorio del día de hoy empezamos el Taller 7, cuyo propósito era repasar métodos numéricos para resolver ecuaciones diferenciales. Sobre esto vale la pena revisar la función `odeint` de la libreria de **scipy**. 
A su vez, para visualizar los resultados, también tuvimos que revisar las funciones de matplotlib que nos permiten graficar en 3D. Para realizar estas gráficas recordar ejecutar la siguiente línea de código: `from mpl_toolkits.mplot3d import Axes3D`

Para conocer más sobre esta actividad, *ir a MC/Talleres/Taller7.*

**Magistral** 

Juan nos enseñó a descargar y utilizar la libreria de sympy, la cual nos permite realizar cálculos simbólicos. 

Para descargarla: `pip install sympy`

Para declarar símbolos: `sim sim2 = symbols('sim sim2')`

Para derivar funciones: `diff(func, variableDiferenciación)`

Para integrar funciones: `integrate(func, (variable, lim1, lim2))`

**Hands-On**

###Demuestre las ecuaciones utilizadas para los métodos de Adams-Bashforth de orden 2, 3 y 4 (ver Scherer eq. 11.72). Utilice Sympy como ayuda en los cálculos simbólicos. log

Los polinomios de Lagrange son funciones que interpolan funciones continuas más complejas y la reducen a expresiones polinómicas. Se crean mediante sumatorias según el grado del polinomio que se busque. Para saber más sobre esto referirse a [Polinomios de Lagrange](http://www.matematicasvisuales.com/html/analisis/interpolacion/lagrange.html)

```
from sympy import *

#Polinomio de Lagrange Grado 2

t, fn, fn1, h, tn, tn1, p = symbols('t fn fn1 h tn tn1 p')

tn1=tn-h

p=fn1*((t-tn)/(tn1-tn)) + fn*((t-tn1)/(tn-tn1))

simplify(integrate(p,(t,tn,tn+h)))
```

 La respuesta me da: h*(3*fn - fn1)/2
 
 ```
 #Polinomio de Lagrange grado 3

fn2,tn2,p2=symbols('fn2 tn2 p2')

tn2=tn1-h

p2= fn1*(t-tn)*(t-tn2)/((tn1-tn)*(tn1-tn2))+fn*(t-tn1)*(t-tn2)/((tn-tn1)*(tn-tn2))+fn2*(t-tn)*(t-tn1)/((tn2-tn1)*(tn2-tn))

simplify(integrate(p2,(t,tn,tn+h)))

 ```
 
 La respuesta me da: h*(23*fn - 16*fn1 + 5*fn2)/12
 
 ```
 #Polinomio de Lagrange grado 4

fn3,tn3,p3=symbols('fn3 tn3 p3')


tn3=tn2-h

p3= fn1*(t-tn)*(t-tn2)*(t-tn3)/((tn1-tn)*(tn1-tn2)*(tn1-tn3))+fn*(t-tn1)*(t-tn2)*(t-tn3)/((tn-tn1)*(tn-tn2)*(tn-tn3))+fn2*(t-tn)*(t-tn1)*(t-tn3)/((tn2-tn1)*(tn2-tn)*(tn2-tn3))+fn3*(t-tn)*(t-tn1)*(t-tn2)/((tn3-tn1)*(tn3-tn)*(tn3-tn2))

simplify(integrate(p3,(t,tn,tn+h)))

 ```
La respuesta me da: h*(55*fn - 59*fn1 + 37*fn2 - 9*fn3)/24

 
##Proyecto Final 
 
 **9 de Junio, 2015**
 
 Para el proyecto final quiero hacer algo que tenga alguna relación con la carrera que estudio, Geociencias. 
 Aún no sé que hacer con claridad pero, en principio, podría usar software de graficación como Matplotlib y python para realizar diagramas de análisis geoquímico ya que estos son considerablemente complicados de hacer en programas tradicionales como Excel. 
 
 A grandes rasgos, el programa podría funcionar como un script dónde el usuario solo deba introducir como parámetro los valores correspondientes a la composición química de la roca y el programa devuelva a que serie pertenece la roca y qué posible origen tenga. 
 
 **15 de Junio, 2015**
 
 El `subplot`, función de **Matplotlib**, puede ser una herramienta indispensable para obtener varios diagramas geoquímicos simultáneamente. Remitirse a la case del 10 de junio (Lissajous figures). 

**16 de Junio, 2015**

Revisar este [link](https://www.wakari.io/sharing/bundle/bultako/CursoPythonCientifico?has_login=False) Tiene bastantes tips útiles sobre el manejo de python. 

**23 de Junio, 2015**

Cuando un geólogo manda unas muestra a analizar, el laboratorio devuelve sus resultados en un archivo .csv cuyo formato está ya estandarizado, es decir el orden en el que se presentan los elementos y sus composiciones es siempre el mismo por lo cual mi programa solo tendría que acomodarse a ese formato y tomar los valores necesarios para cada diagrama de columnas del .csv ya conocidas.

Por decir algo, en caso de que el usuario quiera realizar un [diagrama ternario](https://es.wikipedia.org/wiki/Diagrama_ternario), debo crear una función que reciba 3 parámetros. Los parámetros serán los símbolos de los elementos o compuestos  (Ejemplo Si, Fe, TiO2, etc) e, inmediatamente, el programa reconoce estos strings como columnas del archivo que el usuario ha subido al programa. 

El plotear las composiciones de los tres factores del diagrama devolverán unas ciertas coordenadas sobre un triángulo baricéntrico, como el que se describe en el anterior link. Obteniendo así la gráfica deseada lista para descargar.

Próximamente subiré un ejemplo del archivo que el laboratorio envía con los resultados. 

**1 de Julio** 

Al comentarle la idea sobre los diagramas geoquímicos a Juan me advirtió que puede que el proyecto termine siendo muy sencillo por lo que estoy pensando incluir una sección en la que el programa automáticamente realice una análisis de la roca estudiada. Es decir, al presionar un botón; el programa le dará al usuario un "diagnóstico" de la naturaleza de la roca que se está analizando. Esto puede ser del siguiente estilo: "Las muestras entregadas corresponden a una roca **ígnea**, probablemente cristalizada de una magma **altamente máfico**. Su composición en **óxidos de hierro** es muy **elevada** por lo cual se asume que correspone a la **serie toleítica.**"

En el anterior texto, las palabras que están en letra cursiva varían según los datos que proporcionen los cálculos. 

También será importante dedicarle un buen tiempo a la interfaz para que el programa sea amigable con el usuario. 
 




