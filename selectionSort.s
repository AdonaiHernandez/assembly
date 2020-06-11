JMP start
array: 	DB "3254861" ;"1234568"
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
	ADD D, C
	ADD A, D
	MOV B, [A]
	CMP B, 0
	JZ finishInner
	SUB B, 0x30
	CMP D, 0
	JZ newMin
	CMP B, [min]
	JB newMin
	JMP incrementar
newMin:
	MOV [min], B
	MOV [minPos], A
incrementar:
	SUB A, D
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
	
	PUSH C
	PUSH A
	MOV A, array
	ADD A, C
	MOV D, A
	MOV A, array
	ADD A, [minPos]
	
	MOV A, array
	ADD A, D
	MOV B, [A]
	MOV C, [min]
	ADD C, 0x30
	MOV [A], C

	MOV A, array
	ADD A, [minPos]
	ADD B, 0x30
	MOV [A], B
	POP A
	POP C
	INC C
	MOV D, 0
	JMP inner
stop:
	HLT	
