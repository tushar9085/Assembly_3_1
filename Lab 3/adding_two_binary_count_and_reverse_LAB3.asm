;ADDING TWO BINARY NUMBER 
;SHOWING THE RESULT
;COUNT THE NUMBER OF 1'S
;REVERSE THE SUM

.MODEL SMALL

.DATA

B1 DB ?
B2 DB ? 
COUNT DB 0
COUNT1 DW 0
SUM DB ?

MSG1 DB 0AH,0DH,"TYPE A BINARY NUMBER,UP TO 8 DIGITS: $"

MSG2 DB 0AH,0DH,"THE BINARY SUM IS $"

MSG3 DB 0AH,0DH,"TOTAL NUMBER OF 1 IS $"   

MSG4 DB 0AH,0DH,"REVERSE STRING IS $"

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV BL,0
    MOV CX,8
    MOV AH,1 
    
    
    MOV SI,0
    
    
    
    L1:
        
        INT 21H
        CMP AL,0DH
        JE  ANOTHER
        SUB AL,30H
        SHL BL,1
        OR BL,AL
        LOOP L1
        
    
    ANOTHER:
        
        MOV B1,BL
        
        MOV AH,9
        INT 21H
        MOV BL,0
        MOV CX,8
        
        MOV AH,1
        
    L2:
        
        INT 21H
        CMP AL,0DH
        JE RESULT
        
        SUB AL,30H
        SHL BL,1
        OR BL,AL
        LOOP L2
        
        
    RESULT:
        
        MOV B2,BL
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        
        ADD BL,B1 
       
         
        MOV AH,2 
	MOV CX,8
        JC PRINTCARRY 
	JNC L3
        
            
    PRINTCARRY:
        MOV DL,'1'
        INC COUNT  
        INC COUNT1
        MOV SUM[SI],DL 
        INC SI
        INT 21H

        
        
    L3:
        
        SHL BL,1
        JC PRINTONE
        
        MOV DL,'0' 
        
        MOV SUM[SI],DL  
        INC SI
        INC COUNT1
        
        INT 21H
        
        JMP CONTINUE
        
    PRINTONE:
    
        MOV DL,'1' 
        INC COUNT
        
        INC COUNT1
        MOV SUM[SI],DL
        INC SI  
        
        INT 21H

        
    CONTINUE:
        
        LOOP L3
        
    
    MOV AH,9
    LEA DX,MSG3  ;PRINTING NUMBER OF 1
    INT 21H
        
    MOV AH,2
    ADD COUNT,48
    
    MOV DL,COUNT
    INT 21H
    
    
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
       
    
    
    MOV DI,COUNT1
    
    MOV CX,COUNT1
    
    
    MOV AH,2
    
    
    OP:
    
        DEC DI
        MOV DL,SUM[DI] 
        INT 21H
        
        LOOP OP
        
        
        
   END MAIN