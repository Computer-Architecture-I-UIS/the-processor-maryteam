 Mary Zuleika Jimenez Diaz 2150952 - Camilo Santamaria 2145548 - Alejandro Navarro Luna 2160472/ MARYTEAM 
================
PROCESADOR
================

DIAGRAMA DE BLOQUES
-------------------


![DATAPAT](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/DATAPAT.png)




DESCRIPCIÓN
----------------

Para la simulación y puesta en marcha del procesador se usarón 3 archivos, en los cuales podemos destacar
el decodificador dado a nuestra disposición para el desarrollo de la actividad  (archivo InstDeco). Se emplearón los archivos de ALU (Unidad Logica de Aritmetica), la cual permitia hacer operaciones basicas como la adición,la sustración el corrimiento de bits la comparación de variables entre otras. Finalmente el archivo TOP, en este se encuentran los otros bloques lógicos del diagrama. Se inicializa una banco de registros de 32 direcciones con un tamaño de palabra de 32 bits. También se encuentra la "memoria de instrucciones". 

En el archivo TOP se colocan las instrucciones del programa dentro de la estructura ```when ...  .elsewhen``` la cual actúa como un multiplexor. El archivo ALU utiliza el ```opcode```, ```funct3``` y ```funct7``` de las palabras de 32 bits de RISC-V para determinar la operación correspondiente. 

Los módulos en scala se situan dentro de un archivo TOP el cual une los archivos nombrados
anteriormente y con esto podemos simular y generar el  archivo en vivado que se usó para generar el testbench para 
visualizar las salida del procesador en el GTK Wave

COMENTARIOS
----------------------
1. Se tuvo que realizar contador para colocar un elemento de control.

2. El procesador se demora 4 ciclos de reloj en realizar una operación.

3. Es necesario escribir las instrucciones dentro del archivo ```TOP.scala```.

4. No se encontró una forma para realizar las operaciones ```lui``` y ```auipc``` dentro de los 4 ciclos de reloj necesarios para cada operación.

LISTADO DE INSTRUCCIONES 
------------------------
Puede ejecutar:
- ```sll``` - shift left logical
- ```slli``` - shift left logical immediate
- ```srl``` - shift right logical
- ```srli``` - shift right logical
- ```sra``` - shift right arithmetic
- ```srai``` - shift right arithmetic immediate
- ```add``` - add
- ```addi``` - add immediate
- ```sub``` - subtract
- ```xor``` - xor
- ```xori``` - xor immediate
- ```and``` - and
- ```andi``` - and immediate
- ```or``` - or
- ```ori``` - or immediate
- ```slt``` - set
- ```sltu``` - set immediate
- ```slti``` - set unsigned
- ```sltiu``` - set immediate unsigned

No puede ejecutar
- ```lui``` - load upper immediate
- ```auipc``` - add upper immediate to PC


RESULTADOS
----------
Instrucciones y simulación 1

![s1](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/instruc1.png)

![Simulacion1](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/gtk1.png)


Instrucciones y simulación  2

![s2](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/instruc2.png)
![simulacion2](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/gtk2.png)


Instrucciones y simulación 3 

![s3](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/instruc3.png)
![simulacion3](https://github.com/Computer-Architecture-I-UIS/the-processor-maryteam/blob/master/gtk3.png)




