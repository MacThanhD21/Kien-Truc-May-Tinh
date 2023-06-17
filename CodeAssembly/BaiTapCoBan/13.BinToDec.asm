.model small
.stack 100h
.data
    
    input DB 'Nhap vao mot so nguyen: $'
    output DB 13, 10, 'So nguyen ban vua nhap la: $'
    
    tb1 DB 13, 10, 'Nhap so thu nhat : $'
    tb2 DB 13, 10, 'Nhap so thu hai : $'
    
    tb3 DB 13, 10, 'Tong 2 so la : $'
    
    x DW ?
    y DW ?
    
    crlf DB 13, 10, '$'
    
    a DW ?
    b DW ?
    
    tmp DW ?
    
.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
     
    MOV AH, 1
    INT 21h
    
    MOV CL, AL
    CALL endl
    
    while(t--):
        CALL bintodec
    
        CALL endl
        
        MOV AX, BX
        CALL inso
        
        CALL endl
        DEC CX
        
        CMP CL, 0
        JE return 
        
        JMP while(t--)
    
    return:        
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


bintodec PROC 
    
    MOV BX, 0
    ;MOV tmp, 0
    
    lap3:
        MOV AH, 1
        INT 21h
        
        CMP AL, 13
        JE break
        
        SUB AL, '0'
        MOV AH, 0
        
        ; bx = bx * 2 + al
        ADD BX, BX
        ADD BX, AX
        
        JMP lap3
        
    break:
        
        
           
        
    RET
bintodec ENDP


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

 