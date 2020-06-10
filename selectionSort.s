JMP sort
array: 	DB "3425269"
	DB 0
len: 	DB 0
min: 	DB 0
temp:	DB 0
 
sort:
	MOV A, array
	CALL getLength	
	MOV [len], C
	MOV C, 0
	MOV A, array
sortLoop:
	MOV [min], C
	MOV D, 0
innerLoop:
	MOV B, [A] + C
	SUB B, 0x30
	CMP B, [A] + D
	JA saveContinue
	JMP onlyContinue
saveContinue:
	MOV [min], D
onlyContinue:
	CMP D, [len]
	JE continueSort
	INC D
	JMP innerLoop
continueSort:
	PUSH B
	MOV B, [min]
	MOV [temp], [A+B]
	POP B
	MOV [array] + [min], [A] + C
	MOV [array] + [C], [temp]
	INC C
	CMP C, [len]
	JE finish
	JMP sortLoop
finish:
	HLT	

getLength:
	MOV B, [A]
	CMP B, 0
	JNZ continue
	RET
continue:
	INC C
	INC A
	JMP getLength
