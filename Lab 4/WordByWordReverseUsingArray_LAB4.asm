 
 ;Reverse a string word by word and set the vowels lowercase [STACK USED]   
 
 
.MODEL SMALL
.STACK 100H

.DATA
 MSG DW ?

.CODE


MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,0
    MOV SI,0
    MOV DI,0
    
    
    MOV AH,1    
    
    
    INPUT:
        
        INT 21H
        CMP AL,0DH
        JE NEW_LINE
        
            ;compare vowels
        CMP AL,'a' 
        JE CHECK_VOWEL 
        CMP AL,'e' 
        JE CHECK_VOWEL
        CMP AL,'i' 
        JE CHECK_VOWEL
        CMP AL,'o' 
        JE CHECK_VOWEL
        CMP AL,'u' 
        JE CHECK_VOWEL
        
        MOV MSG[SI],AX
        INC SI
        
        JMP INPUT
        
        
    CHECK_VOWEL:
        SUB AL,32
        MOV MSG[SI],AX
        INC SI
        JMP INPUT
    
    NEW_LINE:
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        
    REVERSE:  
 

        MOV BX,MSG[DI]
        
        CMP BL,' '         
        JE POP_START
               
        PUSH MSG[DI]
        INC DI
        INC CX
        
        CMP DI,SI
        JE POP_START
        
        JMP REVERSE
         
        
        
    POP_START:
        
         MOV AH,2         
         POP DX         
         INT 21H         
         LOOP POP_START  
    
    MOV AH,2     
    MOV DL,032
    INT 21H
    
    INC DI    
    CMP DI,SI
    JGE END_
    
    JMP REVERSE
    
    
    END_:
        
        END MAIN
    