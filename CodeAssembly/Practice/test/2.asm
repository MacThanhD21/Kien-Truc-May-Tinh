.model small
.stack 100

.data
    message1 DB 'Nhap so thu nhat: $'
    message2 DB 'Nhap so thu hai: $'
    message3 DB 'Nhap so thu ba: $'
    sumMsg DB 'Tong la: $'

.code
main PROC
    MOV AX, @data
    MOV DS, AX ; thi?t l?p con tr? d? li?u

    ; nh?p s? th? nh?t
    MOV AH, 9
    LEA DX, message1
    INT 21h

    MOV AH, 1
    INT 21h
    SUB AL, '0' ; chuy?n d?i t? k� t? sang s?
    MOV BL, AL ; luu s? v�o thanh ghi bl

    ; nh?p s? th? hai
    MOV AH, 9
    LEA DX, message2
    INT 21h

    MOV AH, 1
    INT 21h
    SUB AL, '0' ; chuy?n d?i t? k� t? sang s?
    MOV CL, AL ; luu s? v�o thanh ghi cl

    ; nh?p s? th? ba
    MOV AH, 9
    LEA DX, message3
    INT 21h

    MOV AH, 1
    INT 21h
    SUB AL, '0' ; chuy?n d?i t? k� t? sang s?
    MOV DL, AL ; luu s? v�o thanh ghi dl

    ; t�nh t?ng
    MOV AX, 0 ; kh?i t?o gi� tr? ban d?u c?a thanh ghi ax
    ADD BL, CL ; c?ng s? th? nh?t v� s? th? hai
    ADC AX, 0 ; c?ng gi� tr? nh? v�o ax
    SUB AX, DX ; tr? s? th? ba

    ; hi?n th? k?t qu?
    MOV AH, 9
    LEA DX, sumMsg
    INT 21h

    MOV AH, 2
    MOV DL, AL
    ADD DL, '0' ; chuy?n d?i t? s? sang k� t?
    INT 21h

    MOV AH, 2
    MOV DL, AH
    ADD DL, '0' ; chuy?n d?i t? s? sang k� t?
    INT 21h

    MOV AH, 4ch
    INT 21h
main ENDP
END main
