#Taller 4
*Métodos Computacionales - Laboratorio*

17-Jun-2015

Haga una copia de este archivo en su repositorio de GitHub en la carpeta /MC/Talleres/Taller4/. No olvide al final hacer un *commit* y un *push*.

# interpolación

1. Del segundo capítulo del [libro de Scherer](http://link.springer.com.ezproxy.uniandes.edu.co:8080/book/10.1007\%2F978-3-642-13990-1) resuelva los literales c y d del problema 2.1.

##2.1)C)

El ajuste para todos los datos fue perfecto, el coeficiente de correlación (`stats.pearsonr`) fue 1 en todos los casos sin embargo, cuando se obtienen más datos de la función seno y se comparan con los ajustes, el lineal es el que más falencias tiene.

```
%pylab inline
x=array([0,pi/2,pi,3*pi/2,2*pi])
senx=array([0,1,0,-1,0])
scatter(x,senx, color="red", label="Datos sen(x)")
legend()
show()

from scipy import interpolate
from scipy import stats

ajusteLagrange=interpolate.lagrange(x,senx)

t=linspace(0,2*pi)
plot(t,ajusteLagrange(t), color="green", label="Interpolacion Lagrange") 
scatter(x,senx, color="red", label="Datos sen(x)")
legend()
show()
#Usando stats.pearsonr el coeficiente de correlación para este ajuste me da 1, es decir el ajuste es perfecto.

t=linspace(0,2*pi)
scatter(x,senx, color="red", label="Datos sen(x)")
coef=polyfit(x, senx, 4)
poli=poly1d(coef)
plot(t,poli(t), color="purple", label="Ajuste polinomial")
legend()
show()
#Usando stats.pearsonr el coeficiente de correlación para este ajuste también da 1.

AjusteLineal=interpolate.interp1d(x, senx, kind='linear')
t=linspace(0,2*pi)
scatter(x,senx, color="red", label="Datos sen(x)")
plot(t, AjusteLineal(t), label="Ajuste Lineal")
legend()
show()

#coefCorrelación=stats.pearsonr(senx,AjusteCualquiera(x))


AjusteCubico=interpolate.interp1d(x, senx, kind='cubic')
t=linspace(0,2*pi)
scatter(x,senx, color="red", label="Datos sen(x)")
plot(t, AjusteCubico(t), label="Ajuste Cubico")
legend()
show()


#coefCorrelación=stats.pearsonr(senx,AjusteCualquiera(x))
```
##2.1)D)

```
%pylab inline


#Punto (d)
#Defino los datos tomados de la tabla
x = array([-3,-2,-1,0,1,2,3])

yPulso = array([0,0,0,1,0,0,0])
yEscalon = array([0,0,0,1,1,1,1])

#Empezaré a hacer las interpolaciones, por lo cual descargo la libreria de interés
from scipy import interpolate

cubicPuls = interpolate.interp1d(x,yPulso,kind='cubic')
cubicEsc = interpolate.interp1d(x,yEscalon,kind='cubic')

poliPuls = interpolate.lagrange(x,yPulso)
poliEsc = interpolate.lagrange(x,yEscalon)

#Gráficos


figure(figsize=(6, 7))
t=linspace(-3,3,100)
scatter(x,yPulso,color="blue",label='Datos del pulso')
plot(t,cubicPuls(t),color="red",label='Ajuste cúbico')
plot(t,poliPuls(t),color="purple",label='Ajuste polinomial')
legend()
title("Pulsatory Oscillation")
ylim(-0.5,1.4)
savefig("Pulso")

figure(figsize=(6,5))
t=linspace(-3,3,100)
scatter(x,yEscalon,color="blue",label='Datos del escalón')
plot(t,cubicEsc(t),color="red",label='Ajuste cúbico')
plot(t,poliEsc(t),color="purple",label='Ajuste polinomial')
legend(loc=4)
title("Step Oscillation")
savefig("Osc")
show()
```

Las gráficas que obtuve son las siguientes:

![alt text](https://cloud.githubusercontent.com/assets/12629060/8243450/5de03316-1617-11e5-91f0-ce6e8886d50d.png) 
Gráfica 1

![alt text](https://cloud.githubusercontent.com/assets/12629060/8243451/5df3c502-1617-11e5-8c35-b4e4ddcf0d0f.png) 
Gráfica 2

El comportamiento que describen los ajustes para ambos conjuntos de datos, si bien a primera vista no parece la tendencia típica de una onda estacionaria, sí pueden ser considerados movimientos oscilatorios que han sufrido algún tipo de perturbación por un agente externo alrededor del t=0. 

Para el primer caso, el efectuar un pulso obre el medio en el que viaja la onda puede aumentar su amplitud momentáneamente sin embargo, esta eventualmente volverá a su amplitud y frecuencia natural.

Para el segundo caso, un cambio de medio pudo haber provocado el fenómeno del escalón en la onda.

3. La implementación de cierto algoritmo necesita puntos uniformemente muestreados pero los datos que se tienen son los mostrados en la tabla de abajo. Produzca una nueva tabla con el mismo número de líneas pero con muestreo uniforme usando un *cubic spline* .

	| x        | y           |
| ------------- | ------------- |
|0.138490669327|2.30060161547|
|0.153824397539|2.31193402603|
|0.229578204444|2.30212660197|
|0.266435179672|2.25835963399|
|0.276929414769|2.24136088402|
|0.334159056347|2.11468161418|
|0.383612191183|1.96176872424|
|0.446434890218|1.71619353619|
|0.541989923364|1.25473903911|
|1.33433323552|-1.434111205|
|1.44538290595|-1.20791779482|
|1.51883847305|-0.991229025177|
|1.6057389642|-0.687154743681|
|1.74396177688|-0.152610073833|
|1.87038245824|0.324964643125|
|2.30863773381|1.31618219677|
|2.38628525713|1.37058691008|
|2.46587111271|1.4006163649|
|2.65137821271|1.41356286272|
|2.75152244191|1.41133466756|
|2.82756611885|1.41289890942|
|4.19566321688|0.0396966472625|
|4.3105185461|-0.0681282942773|
|4.45641816306|-0.0704087548339|

Haré primero un ajuste cúbico usando la función `interpolate.interp1d` luego de ese ajuste obtendré 24 datos uniformemente espaciados.
```
datosX=array([0.138490669327,0.153824397539,0.229578204444,0.266435179672,0.276929414769,0.334159056347,0.383612191183,0.446434890218,0.541989923364,1.33433323552,1.44538290595,1.51883847305,1.6057389642,1.74396177688,1.87038245824,2.30863773381,2.38628525713,2.46587111271,2.65137821271,2.75152244191,2.82756611885,4.19566321688,4.3105185461,4.45641816306])
datosY=array([2.30060161547,2.31193402603,2.30212660197,2.25835963399,2.24136088402,2.11468161418,1.96176872424,1.71619353619,1.25473903911,-1.434111205,-1.20791779482,-0.991229025177,-0.687154743681,-0.152610073833,0.324964643125,1.31618219677,1.37058691008,1.4006163649,1.41356286272,1.41133466756,1.41289890942,0.0396966472625,-0.0681282942773,-0.0704087548339])


from scipy import interpolate

AjusteCubico=interpolate.interp1d(datosX, datosY, kind='cubic')

#Inicializo la variable t que tendrá los 24 datos que se nos piden.
t=linspace(datosX[0],datosX[23], 24)
Y=AjusteCubico(t)

#Imprimir nueva tabla uniformemente espaciada
for i in range(24):
   print ("  x  |  y  \n -----|-----")
   print(t[i],"|", Y[i])
```
    



**Al terminar la clase ejecute `lottery.sh` para saber si su taller va a ser revisado.**
