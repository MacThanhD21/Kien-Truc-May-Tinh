

.model small
.stack 100h
.data
    tbao1 DB 'Nhap ky tu : $'
    tbao2 DB 13, 10, 'Ky tu vua nhap la : $'
    char  DB ? , '$'
    
.code

main PROC
    
    MOV AX, @data
    MOV DS, AX
             
    MOV AH, 9        
    LEA DX, tbao1
    INT 21h      
    
    MOV AH, 1
    INT 21h  
    MOV char, AL
    
    MOV AH, 9        
    LEA DX, tbao2
    INT 21h
    
    LEA DX, char
    MOV AH, 9
    INT 21h                
    
    MOV AH, 4ch
    INT 21h
  
main ENDP

    ENDP main


