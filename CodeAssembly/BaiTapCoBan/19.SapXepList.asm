
      ; Sap Xep List

.model small
.stack 100
.data
    
    list DB 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
    
    crlf DB 13, 10, '$'
    
    x DW ?
    y DW ?
    
.code
main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    LEA SI, list    
    MOV CL, 0 ; dem i 
    
    lapI:
    
        CMP CL, 9
        JE breakk
        MOV BX, SI ; bx coi la bien pos
        
        MOV DI, SI ; di xét for j
        
        MOV CH, CL ; dem j
         
        lapJ:
            CMP CH, 10
            JE breakkk
            
            MOV AL, [BX]
            CMP [DI], AL
            
            
            JGE tieptuc1
            
            MOV BX, DI            
            
            tieptuc1:
            
                INC CH  ; j++
                INC DI  ; j++
                
                JMP LapJ
         
        
        breakkk:
            
            CMP BX, SI
            JE  tieptuc2
            
            MOV DL, [BX]
            MOV DH, [SI]
            MOV [SI], DL
            MOV [BX], DH
            
            
            tieptuc2:
            
                INC CL  ; i++
                INC SI  ; i++
                
                JMP lapI 
        
    breakk: 
    
        LEA SI, list
        MOV CL, 10
        MOV CH, 0
    lapIN:
    
        MOV AL, [SI]
        MOV AH, 0
        
        CALL inso
        CALL endl
         
        INC SI
         
        DEC CL
        CMP CL, 0
        JE return  
        
        JMP lapIN
        
    return:        
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
    MOV DX, 0
    
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

 