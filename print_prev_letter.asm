.MODEL SMALL
.STACK 100H
.DATA   
P1 DB 'X = $'
P2 DB 'Y = $'
Z DW ?
X DW ?
Y DW ?

.CODE 

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET P1
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H 
    MOV X, AX
    
    MOV DX, OFFSET P2
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H 
    MOV Y, AX
    
    
    LEA DX, X
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN