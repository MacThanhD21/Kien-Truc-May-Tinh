
      ; Tinh n!
      ; Tinh A^n

.model small
.stack 100h
.data
    crlf DB 13, 10, '$'
    
    A DW ?
    n DW ?
    
    x DW ?
    y DW ?
    
    tmp DW ?
    
.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
     
    ;CALL nhapso
    ;MOV CX, AX
    ;MOV AX, 1
    ;lap:
        ;MUL CX
        ;LOOP lap
    
    ;CALL endl
    ;CALL inso
    
    CALL nhapso
    MOV A, AX
    
    CALL endl
    CALL nhapso
    MOV n, AX
    
    MOV AX, 1; luu ket qua
    MOV CX, n
    
    lap1:
        MUL A
        LOOP lap1
    CALL endl
    CALL inso
    
    
    ;return        
    MOV AH, 4ch
    INT 21h

main ENDP

; h�m endline
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

; h�m nhap
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

;HamIn
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

 