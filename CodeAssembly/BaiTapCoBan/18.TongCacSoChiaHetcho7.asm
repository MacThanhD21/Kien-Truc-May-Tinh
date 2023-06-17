
      ; Dem tan suat cua Max

.model small
.stack 100
.data
    crlf DB 13, 10, '$'
    
    x DW ?
    y DW ?
    
    list DB 7, 14, 100, 100, 100, 5, 8, 9, 20, 28

.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    LEA SI, list
    
    MOV BH, 0
    MOV BL, 7
    MOV CX, 10
    
    lap:
        ; Trong phep chia 8 bit : AH luu du, AL luu nguyen
        MOV AL, [SI]
        MOV AH, 0
        
        DIV BL  ; AH = AX % 7
                ; AL = AX / 7
        CMP AH, 0
        
        JNE continue
        
        ADD BH, [SI]
        
        continue:
            INC SI                
            LOOP lap
        
    MOV AH, 0
    MOV AL, BH
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

 