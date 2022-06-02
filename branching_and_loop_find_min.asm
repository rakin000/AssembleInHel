.MODEL SMALL
.STACK 100H
.DATA 
P1 DB 'n = $'
P2 DB '$'
MSG DB 'LOOP ENDED$'
M2 DB 'Y = $'
X DB ?
Y DB ?
N DB ? 

CR EQU 0DH
NL EQU 0AH

.CODE  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
; find min of n byte inputs 
           
    MOV AH,9
    MOV DX, OFFSET P1
    INT 21H
    
    MOV AH, 2
    MOV DL, NL
    INT 21H
    MOV DL, CR
    INT 21H
    
    MOV AH, 1
    INT 21H    
    MOV N, AL
    SUB N, 30H
    
    MOV X, 0H
    
    LOOP:
        MOV DL, N
        CMP X, DL
        JGE END_LOOP
        
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        
        CMP X, 0
        JE IF 
        JMP ELSE
        IF:
            MOV Y, AL
            JMP ENDIF
        ELSE: 
            CMP Y, AL
            JG IF2
            JMP ENDIF2
            IF2:
                MOV Y,AL
                JMP ENDIF2
            ENDIF2: 
            JMP ENDIF
            
        ENDIF:  
        
        INC X
        JMP LOOP
    END_LOOP:
    
    
    MOV AH,9
    MOV DX, OFFSET M2
    INT 21H 
            
    ADD Y, 30H
    MOV DL, Y
    MOV AH, 2
    INT 21H
    
    MOV DL, NL
    INT 21H
    MOV DL, CR
    INT 21H
    
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP 
END
    
