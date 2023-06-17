.model small
.stack 100h
.data
    
    tb1 DB 13, 10, 'Nhap so He 10: $'
    tb2 DB 13, 10, 'So He 2 : $'
    
    x DW ?
    y DW ?
    
    crlf DB 13, 10, '$'
    
    a DW ?
    b DW ?
    
.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    CALL nhapso  
    CALL endl
    CALL DectoBin
            
    MOV AH, 4ch
    INT 21h

main ENDP

endl PROC
    
    PUSH AX
    PUSH DX
    
    LEA DX, crlf
    MOV AH,9
    INT 21h
    
    POP DX
    POP AX
    
    RET  
    
ENDP endl 

nhapso PROC
    
    MOV x, 0
    MOV y, 0
    MOV BX, 10
    
    nhap:
        MOV AH, 1
        INT 21h 
        
        CMP AL, 13
        JE nhapxong
        
        SUB AL, '0'; chuyen sang so
        
        MOV AH, 0 ; meo de chuyen sang thanh ghi 16 bit
        MOV y, AX
        
        MOV AX, x
        MUL BX
        ADD AX, y
        
        MOV x, AX
        JMP nhap 
    
    nhapxong:
        MOV AX, x
    
    RET
    
nhapso ENDP

DectoBin PROC
    
    MOV BX, 2
    MOV CX, 0
    
    lap1:
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX, 0
        JG lap1
    
    lap2:
        POP DX
        ADD DX, '0'
        MOV AH, 2
        INT 21h
        LOOP lap2
    RET
        
DectoBin ENDP

inso PROC 
    
    MOV BX, 10 
    MOV CX, 0
    ;MOV DX, 0
    
    process:
            
        ;MOV BX, 10
        MOV DX, 0
        
        DIV BX      ; DX = AX % BX
        PUSH DX
        INC CX
        
        CMP AX, 0
        JG process    
        
    hienthi:
         POP DX
         ADD DL, '0'
         MOV AH, 2
         INT 21h
         LOOP hienthi 
         
    RET
inso ENDP

ENDP main

