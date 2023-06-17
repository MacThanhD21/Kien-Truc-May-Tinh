.MODEL SMALL
.STACK 100H
.DATA

.CODE   
    MOV AX,@DATA
    MOV DS,AX   
    
 ;   MOV AH,2H
    
    ; XOA BIT 
    MOV AX,10
    
    MOV AX, [0x1000]
    AND AX, 0xFFF7 ; Xoa bit thu 3
    MOV [0x1000], AX
    
    INT 21H 
    
    
    ;KIEM TRA BIT
   
    MOV AX, [0x1000]
    AND AX, 0x0004 ; Lay bit thu 2
    CMP AX, 0
    ;  JNE bit_set ; NEu bit thu 2 bang 1 thi nhay den nhan bit_set 
    
    ;LAP BIT
    
    MOV AX, [0x1000]
    OR AX, 0x0002 ; Lap bit thu 1
    MOV [0x1000], AX



    
    
    MOV AH,4CH
    INT 21H

END