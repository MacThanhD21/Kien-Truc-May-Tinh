
 ; Nhap 1 chuoi he 10 => he 2 va in ra man hinh


.model small
.stack 100

.data
    
    msg DB 10, 13, 'So da nhap duoi dang nhi phan : $'
    str DB 10 dup('$')
    
.code

main PROC
    
    MOV AX , @data
    MOV DS, AX
    
    ;
    MOV AX, '#' ; ss
    PUSH AX
    
    ;Nhap so he 10 dang chuoi
    LEA DX, str
    MOV AH, 10
    INT 21h
    
    MOV CL, [str + 1] ; lay so ky tu cua chuoi
    LEA SI, str + 2   ; tro den dia chi cua ky tu dau tien
    MOV AX, 0         ;
    MOV BX, 10        ; He so nhan
    
    ThapPhan:         ; chuyen chuoi thanh so
        MUL BX            ; nhan 10
        MOV DL, [SI]      ; dl = '1'
        SUB DL, 48        ; dl = 1
        ADD AX, DX        ; ax = ax + dx
        INC SI            ; tang si len 1
        LOOP ThapPhan
    
    ; chuyen thanh so nhi phan
    MOV CL, 2 ; he so chia
    
    NhiPhan:
            MOV AH, 0 ; phan du bang 0
            DIV CL    ; chia ax cho 2
            PUSH AX   ; day vao ngan xep
            CMP AL, 0 ; so sanh thuong khac 0 thi chia tiep
            JNE NhiPhan ; jump not equal
            
    MOV AH, 9
    LEA DX, msg
    INT 21h
    
    MOV AH, 2
    
    IN:
        POP DX   ; ;lay tung phan tu trong ngan xep va gan vao dx
        CMP DX, '#'
        JE done  ;
        ;else
        MOV DL, DH ; gan so tu ngan xep vao dl
        ADD DL, '0'
        INT 21h
        JMP IN     ;

    done:
        MOV AH, 4ch
        INT 21h
        
ENDP main