.MODEL SMALL
.STACK 100H
.DATA 
ARR DW 1,2,3,4,5

.CODE 
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
    
    LEA SI, ARR
    
    MOV AH, 2
    MOV DX, [SI]
    INT 21H
    
    ADD SI, 2
    MOV DX, [SI]
    
    INT 21H 
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
