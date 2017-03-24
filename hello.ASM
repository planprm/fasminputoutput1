org	100h			; code starts at offset 100h
jmp start ;запуск функции start
use16				; use 16-bit code

Message db 'Hello world!$' ;строка для вывода
buff db 80,0,80 dup(0)
msg db 'Just a word!$'

start:
    mov     ah,9      ;заносим в регистр ah 9
    mov     dx,Message	;заносим в dx сообщение типа DB и сам Message
    int     21h  ;используем прерывание 21h, чтобы отобразить Message

    mov     ah,08; режим ожидания, пауза программы COM, или EXE
    int     21h ;прерываем, чтобы сработал режим ожидания ah,08

    mov     dx,buff
    mov     ah, 0Ah ;ввода данных, считывание строки
    int     21h
    xor     cx,cx
    mov     al,[buff+1]
    mov     cl, al
    test    al, al

    call    print
    ;call    message

    mov     si,buff+2

    mov     ah,08; режим ожидания, пауза программы COM, или EXE
    int     21h ;прерываем, чтобы сработал режим ожидания ah,08  d


    mov     ax,4C00h
    int     20h ;завершение программы типа COM

print:
    mov ah, 02h
    mov dx, msg
    int 21h

message:
    mov  ah, 9
    mov  dx, msg
    int 21h
    ret