.MODEL SMALL
.STACK 100H
.DATA
X DB ?
Y DB ?
Z DB ?

MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H
    MOV X, AL
    
    MOV AH, 1
    INT 21H
    MOV Y, AL
    
    MOV Z,X
    SUB Z,Y
    SUB Z,Y
    
    MOV Z, DL
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
ENDP MAIN
