# assembly
Para compilar

nasm -f elf64 suma.s -o suma.o

ld suma.o -o suma

./suma


suma -> suma los 2 numeros definidos como num1 y num2 (solo sirve para numeros de 1 cifra y si la suma da menos de 9 XDDDD) pinta el resultado

leer -> simplemente lee un caracter espera el retorno y lo pinta

suma2.0 lo hice con este simulador https://schweigi.github.io/assembler-simulator/  osea para "compilar", simplemente pegarlo ahí, el resultado de la suma se almacena en A

selectionSort -> Esta hecho con el mismo simulador que suma2.0, el problema es que si el "array" es largo, tarda fleje, pueden cambiar el html del selector del clock y ponerle un option con un value de 100 por ejemplo (es el factor multiplicador), se que se puede optimizar, pero me da pere, algún día lo haré xd.
