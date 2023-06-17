;13.UCLN, BCNN:
.model small
.stack 100h
.data
str1 DB 'UCLN: $'
str2 DB 10,13,'BCNN: $'
.code
main PROC
    MOV AX,@data
    MOV DS,AX
    
    MOV CL,7
    MOV CH,9
    
    MOV DL,CL
    MOV DH,CH
    
    uc:
    CMP DL,DH
    JE ucend
    JG ucln
    SUB DH,DL 
    JMP uc
    ucln:
    SUB DL,DH 
    JMP uc
    
    ucend:
    PUSH DX
    MOV AH,9
    LEA DX,str1
    INT 21h
    
    POP DX
    XOR AH,AH
    MOV AL,DL
    PUSH DX
    CALL printnum 
    
    
    
    MOV AH,9
    LEA DX,str2
    INT 21h 
     
    MOV AL,CL
    MUL CH 
    
    POP DX
    DIV DL
    CALL printnum
    
    
    
    MOV AH,4ch
    INT 21h
main ENDP

printnum PROC 
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BL,10
    MOV CX,0
    
    loopcat:
        DIV BL
        PUSH AX
        INC CX
        CMP AL,0
        JE catexit
        XOR AH,AH
        JMP loopcat
    
    catexit: 
    startprint:
        POP AX
        MOV DL,AH 
        ADD DL,'0'
        MOV AH,2
        INT 21h
    LOOP startprint
    POP DX
    POP CX
    POP BX
    POP AX
    RET
printnum ENDP

END main
