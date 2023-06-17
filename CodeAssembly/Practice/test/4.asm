.MODEL small
.STACK 100h

.DATA
    a DW 3
    b DW 4
    result DW ?

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ;g?i th? t?c nh�n
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
    
    ;k?t th�c chuong tr�nh
    MOV AH, 4CH
    INT 21H
   
multiply PROC
    PUSH AX ; luu tr? gi� tr? c?a AX tr�n ngan x?p
    MOV AX, BX ; AX = a
    MOV BX, CX ; BX = b
    XOR CX, CX ; CX = 0 (d? t�nh t?ng c�c s?)
    
multiply_loop:
    TEST BL, 1 ; ki?m tra xem bit cu?i c�ng c?a BX c� b?ng 1 hay kh�ng
    JZ multiply_continue ; n?u kh�ng th� nh?y t?i multiply_continue
    
    ADD CX, AX ; n?u bit cu?i c�ng c?a BX b?ng 1 th� th?c hi?n ph�p c?ng
multiply_continue:
    SHL AX, 1 ; d?ch tr�i AX 1 bit d? nh�n 2
    SHR BX, 1 ; d?ch ph?i BX 1 bit d? ki?m tra bit ti?p theo
    CMP BX, 0 ; ki?m tra xem c� ph?i BX d� b?ng 0 hay chua
    JNE multiply_loop ; n?u chua th� ti?p t?c v�ng l?p
    
    MOV result, CX ; luu k?t qu? v�o result
    POP AX ; kh�i ph?c gi� tr? c?a AX
    RET ; tr? v? kh?i th? t?c
multiply ENDP


ENDP main