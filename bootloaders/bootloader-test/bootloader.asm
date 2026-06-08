bits 16
org 0x7c00

start:
	mov si, string ; si = stack pointer
	call print_string

print_string:
	mov ah, 0eh ; set teletype mode
	mov al, [si] ; al is the "char argument", in this case the bootloader will print only one char
	print_loop:
		int 0x10 ; interrupt for the BIOS 'print' the char
		inc si ; pointer++
		mov al, [si] ; next char
		cmp al, 0
		jnz print_loop
	ret

string db "hello from bootloader", 10, 0

times 510 - ($-$$) db 0

dw 0xAA55
