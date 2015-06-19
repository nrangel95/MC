##Taller 5

El taller lo realicé en el siguiente [notebook](https://www.dropbox.com/s/zs2dhehhh50arho/Taller5.ipynb?dl=0) y esta es la [versión en nbviewer](http://nbviewer.ipython.org/urls/dl.dropbox.com/s/zs2dhehhh50arho/Taller5.ipynb/%3Fdl%3D0)

###Series de Fourier

1. Diseñe y ejecute un experimento numérico que le permita calcular la constante de *Wilbraham-Gibbs*. En ello puede que le resulte útil una rutina de `scipy.optimize` llamada [basinhopping](http://docs.scipy.org/doc/scipy-0.15.1/reference/generated/scipy.optimize.basinhopping.html). Hágalo en un cuaderno de IPython llamdo `gibbs.ipynb`. **Debe** usar *fuerza bruta* y puede asumir que la discontinuidad se da del máximo al mínimo global de las sucesivas aproximaciones a la onda cuadrada.

Esta es la gráfica que obtuve de la serie de Fourier que nos interesa: 

![alte text](https://cloud.githubusercontent.com/assets/12629060/8257523/d469d7f6-1673-11e5-8ac7-79534517698e.png)

Lo que hice para realizar este punto está registrado en el código a continuación debidamente comentado:

```
N=1
#Acá defino una función que me devuelva una serie de fourier de onda cuadrada según el num. de aproxmaciones. (i)
def darSerie(x):
    i=1
    respuesta=0
    while i<=N:
        f=(sin((2*i-1)*x))/(2*i-1)
        respuesta+=f
        i+=1
    return respuesta   

#la función optimize.basinhopping me da un conjunto de datos sobre la funciòn, sacarle el valor absoluto de la función.fun
#me devuelve la distancia desde el 0 hasta el máximo. Como la serie es simétrica, el multiplicar por 2 me da el valor de esa
#constante de Gibbs que estamos buscando. N representa el # de iteraciones que le doy a darSerie().
def ondaCuadrada():
    global N
    maxc=optimize.basinhopping(darSerie,3,niter=100)
    G=2*(abs(maxc.fun))
    N = N +1
    return G

#Como onda cuadrada me devuelve el valor de G para cada iteración, el agregarlo a mi nueva lista a me dará el valor de G en
#función de las iteraciones realizadas para encontrarla.
a=[]
for i in range (20):
    a.append(ondaCuadrada())

```
Ahora, graficar el a que acabo de obtener vs. el número de iteraciones me dará una gráfica como la que se pide en el enunciado de este taller.

```
t=linspace(1,20,len(a))
scatter(t,a)
ylabel("Constante de Gibbs G")
xlabel("Num. de iteraciones para la serie de Fourier de Onda Cuadrada")
xlim(0,22)
legend()
savefig("Taller 5")
show()

```

El resultado del anterior código es este:

![alt text](https://cloud.githubusercontent.com/assets/12629060/8257553/0c7f7d3a-1674-11e5-8f62-8966ce694a1e.png)

---

###GitHub Branches and Tags

La etiqueta v0.33 correspondiente al punto 2 de este taller la puede encontrar en las pestaña de releases de mi repository MC.
