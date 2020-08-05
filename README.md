 Mary Zuleika Jimenez Diaz 2150952 - Camilo Santamaria 2145548 - Alejandro Navarro Luna 2160472/ MARYTEAM 
================
PROCESADOR
================
DESCRIPCIÓN
----------------

Para la simulación y puesta en marcha del procesador se usarón 6 archivos, en los cuales podemos destacar
el decodificador dado a nuestra dispocisión para el desarrollo de la actividad  (carpeta ID de ottcore) y InstDeco, 
tambien se emplearón los archivos de ALU (Unidad Logica de Aritmetica), la cual permitia hacer operacione
basicas como la adición,la sustración el corrimiento de registros la comparación de variables entre otras ,
un archivo de registro de igual forma se emplearón unas instrucciones que se encargan de registrar variables 
de entrada y decidir las operaciones a desarrollarse en el proceso

Estos archivos se situan dentro de un archivo llamado procesador (caja negra) el cual unimos los archivos nombrados
anteriormente y con esto podemos simular y generar el  archivo en vivado que se usó para generar el tench_bench para 
visualizar las salidad del procesador en el GTK Wave

PROBLEMAS ENCONTRDADOS
----------------------
1. El número total de inscripciones con el cual funciona el procesador son 3 ya que con un numero mayor empieza a precentar
problemas

2.Se presento un error con el decodificador el cual constaba  de que no leia valores mayores a 20 bits, el cual se soluciono
cambiando el decodificador al nombrado en la descripción

3.En el archivo ALU no se colocarón todas las instrucciones ya que el procesador representa las instruciones basicas, 
para poder visualizar todas las instruciones de la ALU se tendria que simular cada 3 instruciones ya que ese el el maximo
permitido por el procesador

4. Solo deja usar 3 registros 

