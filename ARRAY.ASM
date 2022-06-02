.MODEL SMALL
.STACK 100H
.DATA

ARR DW 1,2,3,4,5

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA SI, ARR
    
    MOV DX, [SI]
    
    MOV DX, [SI+2]   
    
    MOV [SI+4], 0FFFFH
    
    MOV AH, 4CH 
    INT 21H
MAIN ENDP
END MAIN