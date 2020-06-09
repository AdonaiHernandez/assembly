JMP start	

start:
	MOV A, 10
	MOV B, 2
	MOV C, 1
	MOV D, A
	JMP divide
	HLT
divide:
	SUB A, B
	CMP A, 0
	JNZ divide1
	JMP print
divideMod:
	PUSH C
	MOV C, 1
	MUL 10 
	JMP divide
	
divide1:
	CMP A, B
	JB divideMod
	INC C
	JMP divide
print:
	CMP SP, 0xE8
	JNZ print1 
	POP B
print1:
	MOV D, 232
	ADD B, 0x30	
	MOV [D], B
	INC D
	MOV [D], 0x2E
	INC D
	ADD C, 0x30
	MOV [D], C
	HLT
