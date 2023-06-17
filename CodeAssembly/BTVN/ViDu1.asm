.model small
.stack         
.data
    crlf DB 13,10,'$'
    chaotay DB 'hello!$'
    chaota DB 'Chaoban!$'
.code

main PROC                  
    MOV AX,@data ;khoi dau thanh ghi
    MOV DS,AX
                                                   
    ;hien thi loi chao
    MOV AH,9
    LEA DX,chaotay  
    INT 21h
    
    ;cach 5 dong dung ham 9 cua int 21h
    LEA DX,crlf
    MOV CX,6 ;cx chua so dong cach + 1

lap: INT 21h
     LOOP lap
     
     ;hien thi loi chao dung ham 9 cua int 21h
     LEA DX,chaota
     INT 21h
     
     ;tro ve DOS dung ham 4 ch cua int 21h
     MOV AH,4ch
     INT 21h

main ENDP
END main