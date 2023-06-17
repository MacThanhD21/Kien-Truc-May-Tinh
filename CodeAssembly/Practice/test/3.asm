.model small
.stack 100h

.data
    msg1 DB 'Nhap so n:', '$'
    msg2 DB 'Nhap cac so nguyen:', '$'
    sum DB 0
    n DW ?
    nums DW 100 dup(0)

.code
main PROC
    MOV AX, @data
    MOV DS, AX

    ; nh?p s? lu?ng s? nguy�n c?n t�nh t?ng
    MOV AH, 09h
    LEA DX, msg1
    INT 21h

    MOV AH, 01h
    INT 21h
    SUB AL, 30h ; chuy?n k� t? s? th�nh s? nguy�n
    MOV n, AX

    ; nh?p c�c s? nguy�n
    MOV CX, n ; s? l?n l?p l?i b?ng n
    MOV SI, OFFSET nums ; con tr? d?n m?ng s? nguy�n

    LEA DX, msg2
    MOV AH, 09h
    INT 21h

    loop1:
        MOV AH, 01h
        INT 21h
        SUB AL, 30h ; chuy?n k� t? s? th�nh s? nguy�n
        MOV [SI], AX ; luu s? v�o m?ng
        ADD sum, AX ; c?ng v�o t?ng
        INC SI
        LOOP loop1

    ; in ra t?ng c?a n s? nguy�n
    MOV AX, sum
    MOV DL, AH
    ADD DL, 30h ; chuy?n s? th�nh k� t? s?
    MOV AH, 02h
    INT 21h

    MOV DL, AL
    ADD DL, 30h ; chuy?n s? th�nh k� t? s?
    MOV AH, 02h
    INT 21h

    ; k?t th�c chuong tr�nh
    MOV AH, 4ch
    INT 21h
main ENDP
END main
