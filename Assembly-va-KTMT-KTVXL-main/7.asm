;7. (asembly) IN chuỗi đảo ngược khi điền dấu # trên emu8086
;enter là 13 , esc là 27
.Model small
.Stack 100h
.Data      
    str DB 50 dup ('$')   ; khoi tao chuoi 50 bytes
.code
main PROC           
  MOV AX,@Data
  MOV DS,AX ;khoi tao thanh ghi ds 
  MOV CX,0;gan gia tri cho thanh ghi cx=0
 START:      
  INC CX;increase tang cx len 1
  MOV AH,1 ;nhap 1 ki tu
  INT 21h
  CMP AL,'#';so sanh al voi ki tu # => enter la 13
  JE END ;jump equal :nhay den 'end' neu bang
  PUSH AX ; them phan tu vao ngan xep 
  JMP START;nhay k dieu kien 
  
  END:;ket thuc     
    MOV AH,2 ;in ky tu
    MOV DL,0; in dau cach
    INT 21h  

    DEC CX;decrease:tru cx di 1
    POP DX;lay phan tu o dinh ngan xep dua vao dx     
    MOV AH,2 ;in ky tu
    INT 21h   
    
    CMP CX,1;so sanh cx voi 1
    JNE END;jump not equal :nhay den 'end' neu khong bang      
    ;ve dos												
     MOV AH, 4Ch											
     INT 21h  
main ENDP
END 
