.MODEL small
.STACK 100h

.DATA
    a DW 3
    b DW 4
    result DW ?

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ;g?i th? t?c nhân
    MOV BX, a
    MOV CX, b
    CALL multiply
    
    ;in k?t qu?
    MOV AH, 02H
    MOV DX, result
    ADD DL, 48
    INT 21H
    MOV DL, AH
    ADD DL, 48
    INT 21H
    
    ;k?t thúc chuong trình
    MOV AH, 4CH
    INT 21H
   
multiply PROC
    PUSH AX ; luu tr? giá tr? c?a AX trên ngan x?p
    MOV AX, BX ; AX = a
    MOV BX, CX ; BX = b
    XOR CX, CX ; CX = 0 (d? tính t?ng các s?)
    
multiply_loop:
    TEST BL, 1 ; ki?m tra xem bit cu?i cùng c?a BX có b?ng 1 hay không
    JZ multiply_continue ; n?u không thì nh?y t?i multiply_continue
    
    ADD CX, AX ; n?u bit cu?i cùng c?a BX b?ng 1 thì th?c hi?n phép c?ng
multiply_continue:
    SHL AX, 1 ; d?ch trái AX 1 bit d? nhân 2
    SHR BX, 1 ; d?ch ph?i BX 1 bit d? ki?m tra bit ti?p theo
    CMP BX, 0 ; ki?m tra xem có ph?i BX dã b?ng 0 hay chua
    JNE multiply_loop ; n?u chua thì ti?p t?c vòng l?p
    
    MOV result, CX ; luu k?t qu? vào result
    POP AX ; khôi ph?c giá tr? c?a AX
    RET ; tr? v? kh?i th? t?c
multiply ENDP


ENDP main