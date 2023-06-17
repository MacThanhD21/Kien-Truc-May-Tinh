
; Bai7 : In Chuoi dao nguoc khi nhap dau bat ky


.Model Small
.Stack 100h
.Data
     str 50 dup('$')
     
     ; enter : 13, esc = 27
    
     Tbao1 DB 13, 10, 'Chuoi dao nguoc la : $' 
     CRLF DB 13, 10, '$'
      
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    
    MOV CX, 0; khoi tao cx = 0
    
    start:
        INC CX   ; cx = cx + 1;
        MOV AH, 1
        INT 21h  ; Ky tu duoc nhap luu o AL
        
        CMP AL, '$' ; so sanh ky tu vua nhap voi !
        
        JE enter      ; jump equal : neu bang thi nhay den ham end
        
        ; Neu khac !
        PUSH AX;      
        JMP start   ; quay lai thuc hien
    
    enter:
          MOV AH, 9
          LEA DX, crlf
          INT 21h 
          JMP endd
       
    endd: ; in ket qua 
        
        MOV AH, 2
        MOV DL, 0 ; in dau cach
        INT 21h
        
        DEC CX    ; cx = cx - 1
        POP DX    ; lay phan tu khoi dinh ngan xep va gan vao dx, khong phai lay phan tu dx tu ngan xep
        
        MOV AH, 2 ; in ky tu
        INT 21h
        
        
        
        ; Dieu kien dung
        CMP CX, 1 
        JNE endd  ; JumpNotEqual : nhay den endd neu khong bang
      
      
    MOV AH, 4CH ; 
    INT 21H
    
MAIN ENDP
    END MAIN
