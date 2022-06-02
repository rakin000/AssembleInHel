.MODEL SMALL
.STACK 100H
.DATA   

A DB ?
P1 DB 'A = $'
.CODE 

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
             
    MOV DX, OFFSET P1;
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H 
    MOV A, AL 
     
    ;PRINT NEWLINE
    MOV DL, 0DH 
    MOV AH, 2
    INT 21H
    MOV DL, 0AH 
    MOV AH, 2
    INT 21H 
            
            
    MOV AH, 2
    MOV CL, A
    SUB CL, 41H 
    ADD CL, 1
    MOV DL, 41H
    
 PRINT_LOOP:
    INT 21H 
    INC DL
    DEC CL 
    JNZ PRINT_LOOP 
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN