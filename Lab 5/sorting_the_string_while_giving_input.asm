;Write a program that starts with an initially undefined 
;byte array of maximum size 100, and lets the user Insert 
;single characters into the array in such a way that the array
;is always sorted in ucending order. The program should print
;a question mark, let the user enter a character, and display 
;thearray With the new character Inserted. Input ends when the
;user hits the ESC key. Duplicate characters should be ignored. 
 
;EXAMPLE EXCERCISE 8, CHAPTER 10


.MODEL SMALL
.STACK 100H

.DATA
MSG DB ? 

.CODE 
MAIN PROC
    
    MOV SI,0
    MOV DI,0
    MOV CX,0 
    
    ;First input
    MOV AH,2
    MOV DL,'?'
    INT 21H
        
    ;FIRST INPUT
    MOV AH,1
    INT 21H 
    
    MOV BYTE PTR MSG[SI],AL
    
    ;PRINTING NEW LINE
    MOV AH,2
        
    MOV DL,0DH
    INT 21H
        
    MOV DL,0AH
    INT 21H  
    
    
    
    ;PRINTING FIRST INPUT
    MOV DL,BYTE PTR MSG[SI]
    INT 21H  
    
    ;NEW LINE
    MOV DL,0DH
    INT 21H
        
    MOV DL,0AH
    INT 21H 
    
    
    INC SI 
    
    
    
    
    
    ;PRINTING ANOTHER INPUTS
    
    L1:
        
        MOV AH,2
        MOV DL,'?'
        INT 21H
        
        ;INPUT
        MOV AH,1
        INT 21H
        
        ;EXIT CONDITION
        CMP AL,27
        JE _END
        
        
        ;PUTTING IN ARRAY
        MOV BYTE PTR MSG[SI],AL
        
        ;DI HOLDS THE PREV AND BX HOLD THE CURRENT
        MOV DI,SI
        
        DEC DI
        
        MOV BX,SI
        MOV DL,BYTE PTR MSG[BX]
        
         
        
        INC SI  
        MOV CX,SI
        
        
        CMP BYTE PTR MSG[DI],DL
        
        JG SWAP
        JNG NEWLINE
        
        
        SWAP:
            
            MOV AL,BYTE PTR MSG[DI]
            MOV DL,BYTE PTR MSG[BX]
            
            MOV BYTE PTR MSG[DI],DL
            MOV BYTE PTR MSG[BX],AL  
            
            CMP DI,0
            JE NEWLINE
            JNE NEXT
            
            NEXT:
            
            DEC DI
            DEC BX
            
            
            MOV DL,BYTE PTR MSG[BX]    
            CMP BYTE PTR MSG[DI],DL
        
            JG SWAP 
            JNG NEWLINE  
            
            
                
            
        
        
        
        
        NEWLINE:       
         
            ;PRINTING NEW LINE
            MOV AH,2
        
            MOV DL,0DH
            INT 21H
        
            MOV DL,0AH
            INT 21H
            
            MOV DI,0
            
            PRINT:
                 MOV DL,BYTE PTR MSG[DI] 
                 INT 21H
                 INC DI
                 LOOP PRINT    
                 
                 
            ;PRINTING NEW LINE
            MOV AH,2
        
            MOV DL,0DH
            INT 21H
        
            MOV DL,0AH
            INT 21H
            
        
            JMP L1
        
        
        
       
    _END:
       
        END MAIN
       