.model small
.stack 100h

.data
    message DB 'Ket qua: $'

.code
main PROC
    ; th?c hi?n phép tính 10 + 15 - 20
    MOV AX, 10      ; gán giá tr? 10 cho thanh ghi AX
    ADD AX, 15      ; th?c hi?n phép c?ng 10 + 15 và luu k?t qu? vào AX
    SUB AX, 20      ; th?c hi?n phép tr? 20 t? k?t qu? 10 + 15 và luu k?t qu? vào AX
    
    INT 21h

    
main ENDP
END main
