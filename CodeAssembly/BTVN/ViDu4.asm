
.model small
.stack 100h
.data

.code

main PROC
    
    MOV CL, 4
    ROL BX, CL   ; quay bx di 4 bit
    MOV CL, 4
    
    ROR BH, CL   ; traos 4 bit thap va cao cua bh
    
    ;Ket thuc
    MOV AH, 4ch  ; tro ve DOS   
    INT 21h
    
main ENDP
    END main





