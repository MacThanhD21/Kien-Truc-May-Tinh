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
    
.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    CALL nhapso  
    CALL endl
    CALL dectohex
    
            
    MOV AH, 4ch
    INT 21h

main ENDP

; hàm endline
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

; hàm nhap
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


dectohex PROC
    MOV CX, 0
    MOV BX, 16
    lap1:
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX, 0
        JG lap1
    
    lap2:
        POP DX
        CMP DX, 10 
        
        JL xuly1
        JGE xuly2
        
        xuly1:
        
            ADD DX, '0'
            JMP xuat
        
        xuly2:
            SUB DX, 10
            ADD DX, 'A'
            JMP xuat
                
        xuat:
            MOV AH, 2
            INT 21h
            
        LOOP lap2   
        
    RET
dectohex ENDP


;Hamin
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

