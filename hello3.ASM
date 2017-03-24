format MZ			;Исполняемый файл DOS EXE (MZ EXE)
entry code_seg:start		;Точка входа в программу
stack 200h

segment data_seg		;Cегмент данных
    hello db 'Hello, asmworld!$'    ;Строка
segment code_seg
start:
    ;write your code here
    
    mov ah,09
    mov dx,hello
    int 21h
    
    mov ah,08
    int 21h
    
    xor eax, eax
    ret