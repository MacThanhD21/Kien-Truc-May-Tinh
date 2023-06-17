
      ; Dem tan suat cua Max

.model small
.stack 100
.data
    crlf DB 13, 10, '$'
    
    x DW ?
    y DW ?
    
    list DB 1, 2, 100, 100, 100, 7, 8, 9, 20, 30

.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    LEA SI, list
    MOV BL, [SI]
    MOV BH, 1
    
    MOV CX, 10
    
    lap:
        INC SI
        CMP [SI], BL
        
        JL continue
        JE tangDem
        JG update
        
        
        update:
            MOV BL, [SI]
            MOV BH, 1 
            JMP continue
        
        tangDem:
            INC BH
 
        continue:
            LOOP lap
     
     
     ;CALL endl
     PUSH BX
     
     MOV BH, 0
     MOV AX, BX ; AX = BL
     CALL inso
     CALL endl
     
     POP BX
     MOV BL, BH
     MOV BH, 0
     MOV AX, BX ; AX = Bl 
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

 