.MODEL SMALL
.STACK 100H
.DATA   


.CODE 

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 1
    INT 21H 
   
    MOV DL, AL
    ADD DL, 1FH
    
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN