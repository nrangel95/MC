#Taller 6 - Cinemática
*Métodos Computacionales - Laboratorio*

24-Jun-2015

## Un paseo en el parque X 12 ✵ 

2. El archivo [running_dirty_nov.gpx](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/running_dirty_nov.gpx) tiene la longitud, latitud, altura, y tiempo de un paseo por la ciudad. 

	![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/trip.png?raw=true =500x)

**Procese el archivo para dejarlo en un formato fácil de importar a Python.**
---
Limpié el archivo utilizando TextWrangler, mediante diferentes reemplazos solo dejamos tres columnas separadas por una coma. En estas 6 columnas están los valores correspondientes a longitud, latitud, altura, hora, minutos y segundos, respectivamente.
El resultado de este proceso lo guardamos en un archivo llamado datos.csv. y lo pueden encontrar en el siguiente [link](https://www.dropbox.com/s/vi67wrqaqvctoae/Datos.csv?dl=0) .

**Haciendo los cambios de unidades pertinentes y teniendo en cuenta las características del [sistema de coordenadas esférico](http://mathworld.wolfram.com/SphericalCoordinates.html), calcular las coordenadas cartesianas de cada una de las posiciones registradas.**
---
Acá esta el código debidamente comentado:

```
datos=genfromtxt("datos.csv", delimiter=",")

datos[:,1]=90-datos[:,1] #Acà hallo el complementario de la latitud  y lo reemplazo en la matriz ya que ese es el phi que me interesa.
#Con este reemplazo ya tengo en la primera columna theta, en la segunda phi. El radio de la tierra es el siguiente:
R=6371000

#Inicializo matriz de coordenadas cartesianas.
matrizCart=zeros((len(datos),4), dtype=float)

matrizCart[:,0]=R*sin(radians(datos[:,1]))*cos(radians(datos[:,0])) #Coordenada en X

matrizCart[:,1]=R*sin(radians(datos[:,1]))*sin(radians(datos[:,0])) #Coordenada en Y

matrizCart[:,2]=R*cos(radians(datos[:,1])) #Coordenada en Z

matrizCart[:,3]=((datos[:,3])*3600)+((datos[:,4])*60)+(datos[:,5]) #Tiempo en segundos

#Ahora para inicializar en el punto (0,0,0) y en el tiempo 0, le restaré las 4 componentes a toda la matriz.

X0=matrizCart[0,0]
Y0=matrizCart[0,1]
Z0=matrizCart[0,2]
t0=matrizCart[0,3]


matrizCart[:,0]= matrizCart[:,0]-X0
matrizCart[:,1]= matrizCart[:,1]-Y0
matrizCart[:,2]= matrizCart[:,2]-Z0
matrizCart[:,3]= matrizCart[:,3]-t0

#Esta ya es la matriz normalizada que usaré. 
print(matrizCart)

```

✵ Después calcular los vectores de desplazamiento espacio-temporal tomando como referencia la primera posición registrada. Desprecie la altura.
✵ Usando vectores unitarios en dirección norte y oriente, calcule las coordenadas de los vectores de desplazamiento en ese sistema de coordenadas local. Tome como coordenadas de referencia: latitud 4.5981, longitud -74.0758. Haga una gráfica con la trayectoria. Si quiere que aparezca junto con un mapa busque información sobre **smopy**. 
✵✵ Ahora calcule la distancia recorrida en función del tiempo estimando numéricamente la integral

![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/dist_int.png?raw=true =200x). 
		
		Haga una gráfica.
![](https://raw.githubusercontent.com/ComputoCienciasUniandes/MetodosComputacionalesLaboratorio/master/2015-V/actividades/talleres/Taller6/tripdist.png?raw=true =500x).
	
✵ Estime el tiempo requerido para terminar de recorrer 1, 2 .. 9 km y la posición (en latitud y longitud) en esos instantes.
✵✵ Ahora calcule la rapidez en función del tiempo usando *forward differences*. Tenga en cuenta que los datos no están uniformemente espaciados.
	

✵✵✵ Lo anterior debe resultar muy irregular, proponga alguna estrategia para obtener algo más razonable e impleméntela.
	
