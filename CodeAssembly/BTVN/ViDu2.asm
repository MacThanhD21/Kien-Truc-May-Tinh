

.model small
.stack 100h
.data
     
     CRLF     DB 13, 10, '$'
     ChaoTay  DB 'Hello!$'
     ChaoTa   DB 'Chao ban!$'
     ThongBao DB 'Go vao so dong cach: $'
     check    DB 'Vui Long Nhap Lai : $'
     SoCRLF   DB ?
.code

main PROC
    
    MOV AX, @data
    MOV DS, AX
        
    ; hien thi thong bao dung ham 9 cua int 21h

    
    MOV AH, 9
    LEA DX, ThongBao
    INT 21h ; Go vao so dong cach:
    
    ; doc so dong cach dung ham 1 cua int 21h
   
    MOV AH, 1
    INT 21h 
    
    AND AL, 0FH    ; doi ra he 2
    MOV SoCRLF, AL ; cat di
    
    MOV AH, 9
    LEA DX, CRLF
    INT 21h

    ; hien thi loi chao dung ham 9 cua int 21h
    MOV AH, 9
    LEA DX, ChaoTay
    INT 21h      
    
    ; xuong dong
    
    
    LEA DX, CRLF
    XOR CX, CX
    MOV CL, SoCRLF ;CX chua so dong cach
         2
    LAP: INT 21h
         LOOP LAP
        
         LEA DX, ChaoTa
         INT 21h
                    
    ; Ket thuc chuong trinh
    MOV AH, 4ch
    INT 21h
        
main ENDP
END main




