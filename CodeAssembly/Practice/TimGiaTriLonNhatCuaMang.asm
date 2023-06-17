
; Bai8 : Tim Gia TRi lon Nhat cua Mang


.Model Small
.Stack 100H
.Data
     
     list DB 9,8,7,6,5,4,3,2,1
     x DB ?
     
.Code
MAIN PROC
    MOV AX, @Data
    MOV DS, AX
    MOV CX, 9
    
    
    LEA SI, list ; Dia chi
    MOV DL, [SI] ; gia tri DL = {4,5,6,7,2,9,10,1 }
    INC SI
    
    start:
        LODSB       ; Tang SI va gán [SI] vào thanh AL
        CMP DL, AL  ; DL dang luu gia tri lon nhat , so sanh voi AL vua cap nhat   
        ;if
        JGE BYPASS  ; Neu lon hon hoac bang => nhay den BYPASS
        ;else
        MOV DL, AL  ; Neu nho hon thi cap nhat cho DL
        
        BYPASS:
            LOOP start
    
    ; print the max
    ADD DL, 48      ; chuyen tu ky tu so => ky tu chu cai (dl = dl + 48)
    ;MOV x, DL
    
    MOV AH, 2       ; In ra ky tu do
    INT 21h        
    
    ; Ket thuc
    MOV AH, 4CH ; 
    INT 21H
    
MAIN ENDP
    END MAIN
