 Mary Zuleika Jimenez Diaz 2150952 - Camilo Santamaria 2145548 - Alejandro Navarro Luna 2160472/ MARYTEAM 
================
PROCESADOR
================
DESCRIPCIÓN
----------------

Para la simulación y puesta en marcha del procesador se usarón 6 archivos, en los cuales podemos destacar
el decodificador dado a nuestra dispocisión para el desarrollo de la actividad  (archivo InstDeco), 
tambien se emplearón los archivos de ALU (Unidad Logica de Aritmetica), la cual permitia hacer operacione
basicas como la adición,la sustración el corrimiento de registros la comparación de variables entre otras ,
un archivo de registro de igual forma se emplearón unas instrucciones que se encargan de registrar variables 
de entrada y decidir las operaciones a desarrollarse en el proceso

Estos archivos se situan dentro de un archivo llamado procesador (caja negra) el cual une los archivos nombrados
anteriormente y con esto podemos simular y generar el  archivo en vivado que se usó para generar el tench_bench para 
visualizar las salidad del procesador en el GTK Wave

PROBLEMAS ENCONTRDADOS
----------------------
1. El número total de inscripciones con el cual funciona el procesador son 3 ya que con un numero mayor empieza a precentar
problemas que se corrigio

2.Se presento un error con el decodificador el cual constaba  de que no leia valores mayores a 20 bits, el cual se soluciono
cambiando el decodificador al nombrado en la descripción

3.En el archivo ALU no se colocarón todas las instrucciones ya que el procesador representa las instruciones basicas, 
para poder visualizar todas las instruciones de la ALU se tendria que simular cada 3 instruciones ya que ese el el maximo
permitido por el procesador

4. Solo deja usar 3 registros 

5.Si se usa el mismo registro en las operaciones seguidas presenta un error de simulación , se soluciono asignando ese valor
a otro registro y luego al registro de destino

RESULTADOS
----------
Instrucciones y simulacion 1

![s1](https://user-images.githubusercontent.com/67715438/89457100-79c87500-d72a-11ea-9ca5-87e92df22ada.jpeg)

![Simulacion1](https://user-images.githubusercontent.com/67715438/89456477-8a2c2000-d729-11ea-9f70-fad55d693277.jpeg)


Instruciones y simulacion  2

![s2](https://user-images.githubusercontent.com/67715438/89456799-058dd180-d72a-11ea-97f1-36c5e7bf569f.jpeg)
![simulacion2](https://user-images.githubusercontent.com/67715438/89456805-06befe80-d72a-11ea-885c-8e083af51ccd.jpeg)


Instruciones y simulacion 3 

![s3](https://user-images.githubusercontent.com/67715438/89456954-3d951480-d72a-11ea-807b-45926bd85e36.jpeg)
![simulacion3](https://user-images.githubusercontent.com/67715438/89456957-3f5ed800-d72a-11ea-8e0f-f3460cb17d44.jpeg)




