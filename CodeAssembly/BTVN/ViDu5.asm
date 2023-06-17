.model small
.stack 100
.data
        Str1 DB 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'
        Tbao DB 10, 13,'chuoi da duoc doi: $' 
.Code                                        

MAIN PROC
    MOV AX, @data ; 
    MOV DS, AX
    MOV ES, AX 
    
    LEA SI, Str1 + 7 ; 
    LEA DI, Str1 + 7 ;
     
    STD       ; Dinh Huong Lui
     
    MOV CX, 8 ;  
     
    LAP: 
        LODSB ;
        SUB AL, 20H ;
        STOSB ; 
        LOOP LAP ; 
        
    LEA DX, Tbao ; 
    MOV AH, 9
    INT 21H  
    
    
    
    MOV AH, 4CH ;
    INT 21H
MAIN ENDP
END MAIN
