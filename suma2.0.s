JMP start
num1: DB "21"	;Se crean las 2 variables, los registros son de 8 bits, a si que maximo 256
DB 0
num2: DB "12"
DB 0

start:
	MOV A, num1	;El puntero de num1 se mueve a A para que la subrutina length pueda calcular el largo de la string
	CALL lenght	
	MOV A, 0	;Se resetea A
	MOV B, num1	;Se mueve el puntero de num1 a B para la subrutina parseNum1
	CALL parseNum1
	MOV C, 0	;Se resetea el Contador del largo de la string
	PUSH A		;Se almacena el resultado del primer parse en el stack

	MOV A, num2	;Lo mismo que antes pero con num2
	CALL lenght
	MOV A, 0
	MOV B, num2
	CALL parseNum1
	MOV C, 0
	PUSH A

	POP A		;Pone el segundo valor en A
	POP B		;El primer valor a B
	ADD A, B	;Los suma y se almacena en A

	HLT

parseNum1:
	MOV D, [B]	;Mueve el primer valor de B a D
	SUB D, 0x30	;Lo comvierte en int, osea ahora es un char, los numeros empiezan en 0x30, (0x30 = 0, 0x31 = 1, ....)	
	DEC C		;Decrementa el Contador del length, es lo que uso para ver si el numero termino
	ADD A, D	;Suma A y D, porque en A esta el valor siguiente, al principio es 0 
	CMP C, 0	;Pos eso, se comprara con 0 para saber si terminó
	JNZ parseNum11	;Sigue con parseNum11
	RET		;Vuelve a la subrutina principal
parseNum11:
	MUL 10		;Vale, A lo multiplica por 10 para conseguir las 2 cifras
	INC B		;Incrementa B, el puntero de la string
	JMP parseNum1  	;Vuelve hasta que se haya acabado

lenght:
	MOV B, [A]	;Se mueve el primer valor de A a B
	CMP B, 0	;Se compara que no sea 0, porque 0 es el final del string
	JNZ length1	;Si no es 0 salta a length1
	RET		;vuelve a la subrutina principal (start)
length1:
	INC A		;incrementa A, para obtener el siguiente valor
	INC C		;incrementa C, que es el contardor del largo de la string
	JMP lenght	;salta al principio para hacerlo hasta que se acabe la string
