# assembly
Para compilar

nasm -f elf64 suma.s -o suma.o

ld suma.o -o suma

./suma
