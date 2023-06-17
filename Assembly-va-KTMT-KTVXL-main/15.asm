;15.Tổng 2 số kiểu word
.model tiny
.stack 100h
.data
tb1 DB ‘nhap so thu 1:$’
tb2 DB 13,10 ,’nhap so thu 2:$’
tb3 DB 13,10,’tong 2 so$’
so1 DW 0
so2 DW 0
tong DW 0
.code
main PROC
MOV AX,@data
MOV DS,AX
;in thong bao nhap so thu nhat
LEA DX,tb1
MOV AH,9
INT 21h
nhap1:
MOV AH,1
INT 21h
CMP AL,13 ;so sanh ky tu vua nhap voi 13
JE nhap2 ;neu bang nhap so thu 2
SUB AL,30h ;doi ky tu sang so
MOV AH,0 ;xoa bit cao
MOV CX,AX ;cat so vua nhap vào cx
MOV AX,so1 ;dua bien sô 1 vê kiêu byte de chuan bi nhann vói 10
MOV BX,10 ;gan bx =10
MUL BX ; nhân ax voi 10
ADD AX,CX ;công ket qua vua nhan voi so vua nhap ket qua cât vào ax
MOV so1,AX ; cat kêt qua vao bién sô1
JMP nhap1
nhap2:
LEA DX,tb2 ;hiên thông báo nhâp sô thu 2
MOV AH,9
INT 21h
nhap: MOV AH,1 ;nhap sô thu 2
INT 21h
CMP AL,13 ;so sánh ký tu vua nhâp voi 13
JE tinhtong ;nêu bang thì tính tông
SUB AL,30h ;chuyên ký tu sang dang sô
MOV AH,0 ;xoá bít cao
MOV CX,AX ;cât kêt qua vua nhap vào cx
MOV AX,so2 ;dua biên sô 2 vê kiêu byte
MOV BX,10 ;gan bx=10
MUL BX ;nhân kêt qua vua nhap voi 10
ADD AX,CX ;công kêt qua vua nhân vói sô vua nhâp
MOV so2,AX ;cât kêt qua vào biên sô 2
JMP nhap
tinhtong:
MOV DX,tong
MOV AX,so1 ;dua biên sô 1 ra thanh ghi ax
MOV BX,so2 ;dua biên só 2 ra thanh ghi bx
ADD AX,BX ;công ax voi bx kêt qua cat vao ax
MOV tong,AX ;dua kêt qua tu ax vào biên tông
inso: MOV AH,9 ;hiên thông báo in tông
LEA DX,tb3
INT 21h
MOV AX,tong ;dua kêt qua trongv bien tông ra thanh ghi ax
MOV DX,0 ;xoa bit cao dx
MOV BX,10 ;gán bx=10
MOV CX,0 ;khoi tao biên dêm
chia: DIV BX ;lây kêt qua chia cho 10
PUSH DX ;du o dx dây vao ngan xêp
INC CX ;tang biên dêm
CMP AX,0 ;so sanh thuong voi 0
JE hienkq ;neu bang thì hiên kêt qua
XOR DX,DX ;xoa bit cao trong dx
JMP chia
hienkq: POP DX ;lây du trong ngan xêp ra khoi dx
ADD DL,30h ;chuyên sô thành dang ký tu
MOV AH,2 ;in tông
INT 21h
LOOP hienkq
ra: MOV AH,4ch
INT 21h
Main ENDP
END main
