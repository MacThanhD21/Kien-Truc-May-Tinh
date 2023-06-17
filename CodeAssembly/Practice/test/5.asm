.model small
.stack 100
.data    

    tb1 DB 'moi ban nhap xau: $'
    tb2 DB 'xau ban vua nhap la: $'
    CRLF DB 13, 10, '$'
    xau DB ?

.code
main PROC
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, tb1
    INT 21h
    LEA SI, xau
    MOV AH, 1
    doc:
        INT 21h
        CMP AL, 13
        JE tiep
        MOV [SI], AL
        INC SI
        JMP doc
    tiep:
        MOV [SI], '$'
        MOV AH, 9
        LEA DX, CRLF
        INT 21h
        LEA DX, tb2
        INT 21h
        LEA DX, xau
        INT 21h 
        
    MOV AH, 4ch
    INT 21h
main ENDP
END main
