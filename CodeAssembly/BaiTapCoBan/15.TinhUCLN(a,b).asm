
      ;Tinh UCLN, BCNN(a, b)

.model small
.stack 100h
.data
    crlf DB 13, 10, '$'
    
    a DW ?
    b DW ?
    
    x DW ?
    y DW ?
    
    tmp DW ?
    
.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
     
    CALL nhapso 
    MOV tmp, AX
    CALL endl
    
    CALL nhapso
    CALL endl
    
    MOV BX, tmp
    
    lap:     
        CMP AX, BX
        JE ketqua
        
        JL xuly1
        JG xuly2
        
        xuly1:
            SUB BX, AX 
            JMP ra 
        ; neus khong jmp ra thi no se van nhay xuong xuly2
        
        xuly2:
            SUB AX, BX
         
        ra:
          JMP lap
           
    ketqua:
        CALL inso
        
    ;return        
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

 