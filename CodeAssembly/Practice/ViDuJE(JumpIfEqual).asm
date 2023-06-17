.model small
.stack 100h

.data
    message1 DB 'AL is equal BL$'
    message2 DB 'AL is not equal BL$'

.code

print_string PROC near
    MOV AH, 09h
    INT 21h
    RET
print_string ENDP

main PROC
    MOV AX, @data
    MOV DS, AX 

    MOV AL, 4
    MOV BL, 4
    CMP AL, BL
    JE labell
    
    MOV DX, OFFSET message2
    CALL print_string
    JMP exit  
    
    labell:
        MOV DX, OFFSET message1
        CALL print_string
    
    exit:
    MOV AH, 4ch  
    INT 21h

main ENDP

END main
