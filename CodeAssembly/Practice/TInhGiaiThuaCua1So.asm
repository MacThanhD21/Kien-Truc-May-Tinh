;Nhap vao so va tinh giai thua 


.model small
.stack 100
.data
    TB1 DB 10,13,'KET QUA LA: $' 
    tmp DW 10
.code

main PROC
    MOV AX,@data
    MOV DS,AX   ;khoi tao thanh ghi ds
    
    MOV AH,1    ;nhap 1 ky tu tu ban phim
    INT 21h 
    
    SUB AL,'0'  ;vd :chuyen ky tu'5' ve so 5 
    
    MOV CX,0    ;cx=0
    MOV CL,AL   ;cl=5
 
    LEA DX,TB1 ; in chuoi tb1
    MOV AH,9
    INT 21h
        
        ;1*2*3*4*5
  
    MOV AX,1;khoi tao ket qua ban dau =1
    MOV BX,1 ;bien tang 
    
    Giaithua:            ;tinh giai thua tra ve 1 so
            MUL BX       ;ax * bx luu vao trong ax
            INC BX       ;increase:tang gia tri bx len 1
            CMP BX,CX    ;so sanh bx voi cx 
            ;if true
            JLE giaithua ;neu bx<=cx thi tiep tuc lap
            ;else false
            MOV CX,0     
 
    Repush:           ;lay tu ky tu cua so GIAI THUA vao day vao trong ngan xep
            MOV DX,0
            DIV tmp    ;chia cho 10 <=> DX = DXAX % 10
            ADD DX,'0' ;Chuyen ve dang ky tu
            PUSH DX    ;day vao ngan xep
            INC CX     ;increase : tang cx 1 don vi
            CMP AX,0
            JNE Repush
 
    Run: ;hien thi tung ky tu o trong ngan xep
            
            POP DX   ;lay 1 so o dau ngan xep*
            
            MOV AH,2 ; In 1 ky tu ra màn hình
            INT 21h
            LOOP Run 
            
    ; Ket thuc       
    MOV AH,4Ch
    INT 21h

main ENDP
    END main