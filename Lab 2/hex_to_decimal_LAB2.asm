;enter a hex input
;show it in decimal

.MODEL SMALL 
.STACK 100H 
.DATA 
    STR1 DB 'ENTER A HEX DIGIT: $' 
    STR2 DB 'IN DECIMAL IT IS 1$' 
    ANS DB ? 
    STR3 DB '$' 
    
.CODE 
MAIN PROC 
  
    MOV AX,@DATA 
    MOV DS,AX 
  
     
    LEA DX,STR1 
    MOV AH,9 
    INT 21H 
  
    MOV AH,1 
    INT 21H 
  
    SUB AL,11H 
    MOV ANS,AL 
     
    MOV AH,2 
    MOV DL,0DH 
    INT 21H 
    MOV DL,0AH 
    INT 21H 
     
    LEA DX,STR2 
    MOV AH,9 
    INT 21H 
     
    LEA DX,ANS 
    MOV AH,9 
    INT 21H  
    MOV AH,4CH 
    INT 21H 
    MAIN ENDP 
END MAIN