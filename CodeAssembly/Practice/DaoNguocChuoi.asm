       
 ; Bai6: In chuoi dao nguoc       
                      
.model small
.stack 100
.data
     
     str DB 50 dup('$') ; str gom 50 byte chua 50 gia tri khoi dau
     ThongBao1 DB 10, 13, 'Chuoi sau khi dao nguoc : $', 
          
.code
main PROC
    MOV AX, @data
    MOV DS, AX    
    
    ; Nhap xau
    LEA DX, str ; tro den dau xau     
    MOV AH, 10  ; 10 = 0AH
    INT 21h
    
    ; In chuoi ThongBao1 ra man hinh
    LEA DX, ThongBao1
    MOV AH, 9
    INT 21h
    
    ;vd 123456789 =>len=9 256,9,1,2,3...
    MOV CL, [str + 1]   ;chuyen chieu dai chuoi vua nhap vao cl
    LEA SI, [str + 2]   ;Dua SI tro ve phan tu thu 2 cua mang la ky tu dau tien
    
    Lap1: 
        MOV DX, [SI]; Push lan luot cac ky tu vao ngan xep
        PUSH DX     ; Dua phan tu SI dang tro den vao ngan xep
        INC SI      ; increase: Tang gia tri cua si len 1
        LOOP Lap1   ;
    
    MOV CL, [str + 1] ; chuyen chieu dai chuoi vua nhap vao cl
 
    Lap2:
        POP DX     ; lay gia tri tren dinh ngan xep dua vao dx
        MOV AH, 2  ; in ky tu vua lay ra
        INT 21h    ;
        LOOP Lap2  ;
    
    ; tro ve DOS
    MOV AH, 4ch
    INT 21h
    
main ENDP
    END main
    

