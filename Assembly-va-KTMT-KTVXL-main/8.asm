;8. (asembly)  Tìm giá trị lớn nhất của mảng 
.Model small
.Stack 100H
.Data                
    list DB 9,2,3,4,5,6,7,9,0   
.code
main PROC           
    ; initilize the ds and es registers
    MOV AX, @Data ; 
    MOV DS,AX ;           
    
    MOV CX, 9                         
    LEA SI, list       ; dua gia tri dauu tien cua chuoi vào si
    MOV BL, [SI]       ; dua dia chi si vào bl
    INC SI             ; tang gia tri si them 1

Start:
    LODSB        
    CMP BL, AL ; so sanh al va bl 
    JGE BYPASS;   nhay denn BYPASS               
    MOV BL, AL;      neu al > bl thi gan bl = al;
    BYPASS:
    LOOP Start  ; lap
     
    ; print the max
    ADD BL, '0' ; 	ep kieu so ve kieu ke tu
    MOV DL,BL   ; dua gia tri max bl vào dl;
    MOV AH, 2  ; in ra màn hình
    INT 21H
        
    MOV AH, 4CH ; ket thuc chuong trinh
    INT 21H
main ENDP
END Main
