.MODEL SMALL

.STACK 100H

.DATA  
Y DW ?

CR EQU ODH
LF EQU OAH

HW DB 'HELLO, WORLD!!!$'  
X DB ?

.CODE 

MAIN PROC
    ;DATA SEGMENT INITIALIZATION
    MOV AX,@DATA
    MOV DS, AX
    
    MOV DX, OFFSET HW
    MOV AH, 9
    INT 21H 
    ;MOV BH, 9   DOESNT WORK
    ;INT 22H
    
    ;DOS EXIT
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN