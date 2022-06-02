.MODEL SMALL
.STACK 100H

.DATA
ARR DW 100 DUP(0)  
NUM_STR DB '000000$'
P1 DB 'SIZE OF ARRAY(LIMIT=100) = $'   
I DW ? 
J DW ? 
K DW ?
N DW ?      
SIGN DB ?              
NUM_LEN EQU 5
CR EQU 0DH
LF EQU 0AH 
SPA EQU 20H
TAB EQU 09H 
MINUS EQU 2DH
.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    MOV DX, OFFSET P1
    MOV AH, 9
    INT 21H
    
    CALL NUMBER_INPUT
    MOV N, BX
 
    CALL NEWLINE
    
    MOV I, 0  
    LEA DI, ARR 
    
    NUMBER_INPUT_LOOP:  
        MOV AX, N
        CMP I, AX
        JGE END_INPUT_LOOP  
        
        ;MOV AX, I
        ;CALL NUMPER_OUTPUT
        ;CALL SPACE
               
        CALL NUMBER_INPUT 
        
        MOV ARR[DI], BX
        ADD DI, 2
        CALL NEWLINE
        
        INC I
        ;ADD SI, 2
        JMP NUMBER_INPUT_LOOP
            
    END_INPUT_LOOP:
   ; CALL NUMPER_OUTPUT
    CALL INSERTION_SORT
    CALL PRINT_ARR
    CALL BIN_SEARCH
    MOV AH, 4CH 
    INT 21H
MAIN ENDP    



INSERTION_SORT PROC
    MOV I, 0
    MOV J, 0
                  
    MOV AX, N
    ADD AX, N
    
    MOV K, AX
    
    
    LP1:
        MOV AX, K
        CMP I, AX
        JGE ELP1
            
        MOV AX, I
        MOV J, AX
        
        LP2:   
            CMP J, 0
            JLE ELP2
            
            MOV SI, J
            MOV DI, J
            SUB DI, 2    
            
            MOV AX, ARR[SI]
            CMP ARR[DI], AX
            JLE ELP2           
            PUSH ARR[DI]
            PUSH ARR[SI]
            
            POP ARR[DI]
            POP ARR[SI]   
            SUB J, 2
            JMP LP2
            
        ELP2:       
        ADD I, 2 
        JMP LP1
    ELP1:
           
    RET 
INSERTION_SORT ENDP

BIN_SEARCH PROC 
    CALL NUMBER_INPUT
    
    MOV I, 0 
    MOV AX, N
    MOV J, AX
    SUB J, 1
    
    
    SEARCH:
        MOV AX, J
        CMP I,AX
        JGE ENDSEARCH
        
        
        MOV K, AX
        MOV AX, I
        ADD K, AX
        SHR K, 1
        
        MOV DI, K
        ADD DI, K
        
        CMP ARR[DI], BX    
        MOV DI, K
        JGE GE
        L:   
            MOV I,DI
            ADD I,1
            JMP ENDCMP
        GE:
            MOV J,DI
            JMP ENDCMP
        ENDCMP:
        JMP SEARCH        
    
    ENDSEARCH: 
    MOV DI, I
    ADD DI, I
    CMP ARR[DI],BX
    JNE QUIT
    MOV DL, 'Y'
    MOV AH, 2
    INT 21H    
    RET 
    QUIT:
    MOV DL, 'N'
    MOV AH, 2
    INT 21H
    RET 
BIN_SEARCH ENDP

NUMBER_INPUT PROC  
    ;TAKE INPUT TO BX
    ;MOV CX, NUM_LEN
        
    XOR BX, BX
    MOV SIGN, 0H
    
    MOV AH, 1
    INT 21H
    CMP AL, MINUS
    JNE PLUS
    MOV SIGN, 01H
    JMP INPUT_LOOP
    PLUS:
        MOV BL, AL
        AND BL, 000FH
        
    INPUT_LOOP: 
        MOV AH, 1
        INT 21H
        
        ;END IF WS
        CMP AL, CR
        JE END_LOOP
        CMP AL, LF 
        JE END_LOOP
        CMP AL, SPA
        JE END_LOOP
        CMP AL, TAB
        JE END_LOOP 
        
        AND AX, 000FH
        MOV CX, AX
        MOV AX, 10
        MUL BX
        ADD AX, CX  
        MOV BX, AX
    
        JMP INPUT_LOOP  
    
    END_LOOP:
    CMP SIGN, 01H  
    JNE ENDF
    NEG BX
    ENDF:
    RET
        
NUMBER_INPUT ENDP    

NUMPER_OUTPUT PROC 
    ; PRINTS THE NUMBER (WORD) IN AX  
    
    MOV BX, 8000H
    AND BX, AX
    CMP BX, 0
    JZ NOT_NEG
    
    MOV BX, AX    
    MOV DL, MINUS
    MOV AH, 2
    INT 21H
    MOV AX, BX
    NEG AX
    
    NOT_NEG:
    LEA SI, NUM_STR
    ADD SI, 6
    
    PRINT_LOOP:
        DEC SI
        MOV DX, 0
        
        MOV CX, 10
        DIV CX
        
        ADD DL, '0'
        MOV [SI], DL
        
        CMP AX, 0
        JNE PRINT_LOOP
    
    MOV DX, SI
    MOV AH, 9
    INT 21H
    
    RET
NUMPER_OUTPUT ENDP

PRINT_ARR PROC
    MOV I, 0
    
    LEA DI, ARR
    LP: 
      MOV BX, N
      CMP I,BX
      JGE ENDLP
      
      MOV AX, [DI]
      CALL NUMPER_OUTPUT
      CALL SPACE  
      
      ADD DI, 2
      INC I
      JMP LP
    ENDLP:  
    MOV AH,2
    MOV DL, LF
    INT 21H
    MOV DL, CR
    INT 21H
    RET
PRINT_ARR ENDP

NEWLINE PROC
    MOV AH, 2
    MOV DL, CR
    INT 21H
    MOV DL, LF
    INT 21H
    RET 
NEWLINE ENDP   
SPACE PROC
    MOV AH, 2
    MOV DL, SPA
    INT 21H
    RET 
SPACE ENDP
END MAIN
