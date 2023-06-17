

 ; Bai 10 : chuyen 1 so tu he 10 => 2
 
.model small
.stack 100h
.data

.code
main PROC
    MOV AX, @data
    MOV DS, AX
    
    
    
    
    MOV AH, 4ch
    INT 21h
    
main ENDP
    ENDP main
    
