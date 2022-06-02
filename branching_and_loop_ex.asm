.MODEL SMALL
.STACK 100H
.DATA 
P1 DB '$'
P2 DB '$'
MSG DB 'LOOP ENDED$'
X DB ?
Y DB ?

CR EQU 0DH
NL EQU OAH

.CODE  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
;x = 3;
;while ( x <= 17 ) {
;   stmt1; SET CL = 0
;   stmt2; SET DX = 0
;   ++x;
;}
;stmt1_after_while;  
    MOV X, 3H
    
    LOOP:
        CMP X,17
        JG END_LOOP
        
        MOV AH, 2
        MOV DL, X
        INT 21H 
        INC X 
        JMP LOOP
            
    END_LOOP:  
    MOV AH,9
    MOV DX, OFFSET MSG
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP 
END
    
