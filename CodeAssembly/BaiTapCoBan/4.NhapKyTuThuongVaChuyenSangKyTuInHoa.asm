.model small
.stack 100h

.data
    ; Co 2 kieu du lieu hay dung : DB, DW (DD)
    
    ;ten bien  <kieu du lieu> gia tri khoi tao 
    
    ; Khai bao bien
    x DB 4 ; DB x = 4
    y DW 5 ; dw y = 5
    z DD ? ; dd z  
    
    ; Khai bao chuoi
    ;c1:
    str DB 'Hello!$'
    ;c2:
    str1 DB 50 dup<'$'>
    ;c3:
    str2 DB 'ma hecxa'
    
    ; Khai bao mang
    
    list DB 1, 3, 5, 7
    ;list DB 50 dup<?>
    
    char DB ?, '$'
    noti DB 13, 10, 'Chuyen sang ki tu hoa la : $'

.code

main PROC
    
    MOV AX, @data
    MOV DS, AX
    
    ; Nhap 1 ky tu , in ra 1 ky tu
    
    MOV AH, 1
    INT 21h ; luu o AL
     
    SUB AL, 32   ; al = al - 32
    MOV char, AL ; gan AL vao bien char
    
    ; in ra thong bao 
    
    LEA DX, noti
    MOV AH, 9
    INT 21h
        
        
    ; in ra ky tu vua gan     
    LEA DX, char
    MOV AH, 9
    INT 21h
    
    
    ; Ket thuc CTRINH    
    MOV AH, 4ch
    INT 21h
    
main ENDP

END main


