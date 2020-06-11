JMP start
array: 	DB "2351376" ;"1233567"
       	DB 0
min:	DB 0
minPos:	DB 0
len:	DB 0

start:
	MOV A, array
	MOV B, [A]
	CMP B, 0
	JNZ inner
	HLT
inner:	
	PUSH D
	ADD D, C
	ADD A, D
	MOV B, [A]
	CMP B, 0
	JZ finishInner
	SUB B, 0x30
	PUSH A
	CMP D, 0
	JZ newMin
	CMP B, [min]
	JB newMin
	MOV A, [min]
	CMP A, 0xFF
	JE newMin
	JMP incrementar
newMin:
	MOV [min], B
	MOV [minPos], A
incrementar:
	POP A
	SUB A, D
	POP D
	INC D
	JMP inner
finishInner:
	MOV B, [len]
	CMP B, 0
	JZ setLen
	JMP continueFinish
setLen:
	MOV [len], D
continueFinish:
	CMP C, [len]
	JE stop
	
	MOV A, 232
	ADD A, C
	MOV B, [min]
	ADD B, 0x30
	MOV [A], B
	PUSH C

	MOV A, array
	ADD A, C
	MOV D, [A]
	

	MOV C, [minPos]
	MOV [A], B
	MOV [C], D
	
	POP C
	MOV A, array
	INC C
	MOV D, 0
	MOV [min], 0xFF
	JMP inner
stop:
	HLT	
