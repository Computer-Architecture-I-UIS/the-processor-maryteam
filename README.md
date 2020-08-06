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
1. Se tuvo que realizar contador para colocar un elemento de control

Listado de Instrucciones 
------------------------
Puede ejecutar:
- sll
- slli
- srl 
- srli
- sra
- srai
- add
- addi
- sub
- xor
- xori
- and
- andi
- or
- ori
- slt
- sltu
- slti
- sltiu

No puede ejecutar
- lui
- auipc


RESULTADOS
----------
Instrucciones y simulacion 1

![s1](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/instruc1.png)

![Simulacion1](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/gtk1.png)


Instruciones y simulacion  2

![s2](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/instruc2.png)
![simulacion2](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/gtk2.png)


Instruciones y simulacion 3 

![s3](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/instruc3.png)
![simulacion3](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/gtk3.png)




