.model small
.stack 100

.data    
    tbao DB 13, 10, 'Result : $'
    result DW 0 ; define a word variable to store the result

.code
main PROC
    MOV AX, @data
    MOV DS, AX ; set data segment

    MOV AX, 10 ; move the value 10 into ax
    ADD AX, 15 ; add 15 to ax (ax now contains 25)
    SUB AX, 20 ; subtract 20 from ax (ax now contains 5)
    MOV result, AX ; move the result into the variable

    ; print the result
    
    MOV AH, 9
    LEA DX, tbao
    INT 21h   
    
    MOV AH, 02h ; print character function
    INT 21h
    MOV AH, 02h ; print character function'
    INT 21h
    MOV AX, result ; move the result back into ax
    CALL print_word ; print the result as a decimal number

    MOV AH, 4ch
    INT 21h ; end program
main ENDP

; function to print a word as a decimal number
print_word PROC
    PUSH AX ; save registers
    PUSH BX
    PUSH CX
    PUSH DX

    MOV BX, 10 ; set bx to 10 for division
    MOV CX, 0 ; set cx to 0 for counting digits
print_loop:
    XOR DX, DX ; clear dx
    DIV BX ; divide ax by 10, quotient in ax, remainder in dx
    PUSH DX ; push remainder onto stack
    INC CX ; increment digit count
    CMP AX, 0 ; check if quotient is 0
    JNE print_loop ; if not, continue looping

print_digits:
    POP DX ; pop digit off the stack
    ADD DL, '0' ; convert digit to ASCII code
    MOV AH, 02h ; print character function
    INT 21h
    LOOP print_digits ; print all digits

    POP DX ; restore registers
    POP CX
    POP BX
    POP AX
    RET
print_word ENDP

END main
