

.model small
.stack 100h

.data
    
     crlf DB 13, 10, '$'
     max DB ?
     
     str1 DB 50 dup<'$'>
     str2 DB 50 dup<'$'>
     str3 DB 'Mac van thanh$'
      
.code

main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    LEA SI,str1
    MOV CX, 0
    
    lap1 :
        MOV AH, 1
        INT 21h
        CMP AL, 13
        JE break
        
        MOV [SI], AL
        PUSH [SI]
        
        INC SI
        INC CX
        
        JMP lap1
        
    
    break:
    LEA DI, str2
         lap2:
            POP AX
            MOV [DI], AL
            INC DI
            LOOP lap2
            
    MOV AH, 9
    LEA DX, crlf
    INT 21h
    
    LEA DX, str2
    INT 21h
               
    MOV AH, 4ch
    INT 21h
    
ENDP main