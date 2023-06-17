
.model small
.stack 100h

.data
      crlf DB 13, 10, '$'
.code

main PROC
   
    MOV AX, @data
    MOV DS, AX
    
    ; Dao 1 chuoi ky tu su dung ngan xep
        
    MOV CX, 0
    
    lap1:
        MOV AH, 1
        INT 21h
        CMP AL, 13
        
        JE enter
        
        INC CX        
        MOV DX, AX
        PUSH DX
        
        JMP lap1
     
     enter:
        MOV AH, 9
        LEA DX, crlf
        INT 21h
        
     lap2:
        POP DX
        MOV AH, 2
        INT 21h
        LOOP lap2 
        

    MOV AH, 4
    INT 21h
    
ENDP main
