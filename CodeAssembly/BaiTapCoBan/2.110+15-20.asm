.model small
.stack 100h

.data
    message DB 'Ket qua: $'

.code
main PROC
    ; th?c hi?n ph�p t�nh 10 + 15 - 20
    MOV AX, 10      ; g�n gi� tr? 10 cho thanh ghi AX
    ADD AX, 15      ; th?c hi?n ph�p c?ng 10 + 15 v� luu k?t qu? v�o AX
    SUB AX, 20      ; th?c hi?n ph�p tr? 20 t? k?t qu? 10 + 15 v� luu k?t qu? v�o AX
    
    INT 21h

    
main ENDP
END main
