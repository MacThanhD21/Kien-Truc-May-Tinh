
.model small
.stack 100h
.data
     
     CRLF DB 13, 10, '$' 
     
     Notification DB 'Nhap 1 so he hai(max 16 bit): $'

.code
main PROC       
    
    MOV AX, @data  ; Khoi tao thanh ghi DS
    MOV DS, AX     ; Tro thanh ghi DS ve dau doan data
             
    LEA DX, Notification
    MOV AH, 9
    INT 21h
    
    XOR BX, BX  ; BX chua ket qua, ban dau la 0
    
    MOV AH, 1   ; doc 1 so tu ban phim
    
     
    TIEP: INT 21h
          CMP AL, 13  ; CR?
          JE THOIDOC  ; Neu dung, thoi doc
          
          AND AL, 0FH ; Doi ma ACII ra so
          SHL BX, 1   ; Dich trai BX 1 bit de lay cho
          OR  BL, AL  ; Chen bit vua doc vao ket qua
          JMP TIEP    ; Doc tiep 1 ky tu
    
    THOIDOC: MOV AH,9  
             LEA DX,crlf
             INT 21h
             
     MOV CX, 16       ; cx chua so bit cua bx
     MOV AH, 2        
             
                       
     HIEN:
          LEA DX, CRLF 
          INT 21h          ; hien ky tu 
          ;XOR DL, DL      ; xoa DL de chuan bi doi
          MOV DL, 0;
          ROL BX, 1        ; Dua bit MSB cua BX sang CF
          ADC DL, 30h      ; DOi gia tri bit do sang ASCII
          INT 21h          ; Hien thi 1 bit cua BX
          LOOP HIEN        ; Lap lai cho den het

    ; Ket thuc chuong trinh
    MOV AH , 4ch
    INT 21h
    
main ENDP
    END main