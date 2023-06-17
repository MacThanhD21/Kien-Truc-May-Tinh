              
  ;Bai 5 : chuyen 1 chuoi thanh chuoi thuong va IN ra Man Hinh
  
  ;Trình tu: Nhap chuoi truoc -> IN thong bao -> IN chuoi vua nhap


.model small
.stack 100h

.data
     
     str DB 255 dup('$')
     
     noti1 DB 13, 10, 'Chuyen sang chuoi in THUONG : $'
     
     noti2 DB 13, 10, 'Chuyen sang chuoi in HOA : $'
     
     
    
.code

main PROC
    ;
    MOV AX, @data
    MOV DS, AX   ; khoi Tao thanh ghi DS
    
    ; NhapChuoi
    
    LEA DX, str ; tro den dia chi cua chuoi str
    MOV AH, 10  ; goi ham nhap xau
    INT 21h     ; bat dau nhap xau
    
    
    ; In thuong
    LEA DX, noti1
    MOV AH, 9
    INT 21h
    CALL inThuong   ; goi ham in thuong de in xau thuong
    
    
    ; In Hoa
    
    LEA DX, noti2
    MOV AH, 9
    INT 21h
    CALL inHoa
              
              
    ; Ket thuc CTRINH    
    MOV AH, 4ch
    INT 21h
    
main ENDP
    
    ; Ham con viet o day
    
    ; Ham inThuong
    inThuong PROC
        
        LEA SI, str + 2 ;
        Lap1:    ; Kiem tra tung ky tu 1
            MOV DL, [SI]
            
            CMP DL, 'A'   ; so sanh
            JL In1    ; JumpLess
            
            CMP DL, 'Z'   ; so sanh
            JG In1     ; JumpGreater
            
            ; 4 dong lenh nay tuong duong:
            ; if(x <= 'A' && x >= 'Z') => in ra luôn vì nó ngoài khoang chu Hoa
            
            ; else
            ADD DL, 32 ; chuyen tu hoa => thuong
        
        
        In1:
            MOV AH, 2     ; in tung ky tu
            INT 21h
            INC SI        ; same i = i + 1
            CMP [SI], '$' ; So sanh xem có phai ky tu cuoi cung trong xau chua
            ; Neu chua phai ky tu cuoi cung
            JNE Lap1      ; quay lai ham Lap1
    
      RET  ; return
      
      inThuong ENDP
      
      ; Ham inHoa
      inHoa PROC
            LEA SI, str+2
            Lap2:
            MOV DL, [SI]
            CMP DL, 'a'
            JL In2
            CMP DL, 'z'
            JG In2
            SUB DL, 32 ;chuyen ky tu hoa thanh ky tu thuong
      In2:
            MOV AH, 2
            INT 21H
            INC SI
            CMP [SI], '$'
            JNE Lap2
            RET
      inHoa ENDP
                
END main


