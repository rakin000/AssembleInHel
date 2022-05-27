.MODEL SMALL
.STACK 100H
.DATA
X DB ?
Y DB ?
Z DB ?

.CODE 
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV X, AL
    
    MOV AH, 1
    INT 21H
    MOV Y, AL
    
    MOV AL, X
    SUB AL, Y
    SUB AL, Y
    MOV Z, AL
    
    MOV DL, Z
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
