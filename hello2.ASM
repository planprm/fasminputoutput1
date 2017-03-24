     org      100h

section '.data' data readable
    
	


	mov	 ah,9h
	mov	 dx,hello
	int	 21h
	mov	 ah,8h
	int	 21h
	mov	 ah, 0Ah; ввод строки с клавиатуры
	;mov	  dl, '#'
	int	 21h
	mov	 ah, 8h
	int	 21h
	mov	 ah, 09h; вывод строки
	int	 21h
	int	 20h
	mov	 ax,4C00h
	int	 21h

 hello	db	 13,10,"Hello, World!$"
