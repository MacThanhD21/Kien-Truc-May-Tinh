
  ;Bai 4: Nhap 1 chuoi va in ra
  
  ;Trình tu: Nhap chuoi truoc -> IN thong bao -> IN chuoi vua nhap


.model small
.stack 100h

.data
     noti1 DB 13, 10, 'Nhap chuoi : $'
     noti2 DB 13, 10, 'Chuoi da nhap la : $'; 13 : xuong dong, 10 : lui dau dong
     str DB 100 dup('$')
    
.code

main PROC
    ;
    MOV AX, @data
    MOV DS, AX
     
    
    LEA DX, noti1 
    MOV AH, 9  ; in thong bao
    INT 21h
     
    LEA DX, str ; tro den dia chi cua dau str
    MOV AH, 10  ; 10  = 0ah
    INT 21h     ; bat dau nhap xau
    
    LEA DX, noti2
    MOV AH, 9  ; in thong bao
    INT 21h
    ; dua dx tro den phan tu thu 2 cua xau, vì chi so bat dau cua xau tinh tu 2
    
    LEA DX, [str + 2]; 
    INT 21h
    
        
    ; Ket thuc CTRINH    
    MOV AH, 4ch
    INT 21h
    
main ENDP

ENDP main


