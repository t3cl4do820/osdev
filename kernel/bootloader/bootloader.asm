bits 16
org 0x7C00

start:
	mov si, hello
	call print_string
	jmp read_disk
	jmp loop


read_disk:
	; what disk do we want to read? (diskNum), for example the 'n1' (number 1) of /dev/nvme0n1p1
	; CHS address: C -> Cylinder of the disk, H -> head, S -> Sector of the disk
	; to load the disk in RAM

	ret	




print_string:
	;enter in teletype mode and print 'a' char
	;mov ah, 0x0e
	;mov al, 'a'
	;int 0x10
	
	mov ah, 0x0e
	mov al, [si]
	print_loop:
		int 0x10
		inc si
		mov al, [si]
		cmp al, 0
		jnz print_loop
	ret

loop:
	jmp $


hello db "Hello from bootloader", 10, 0

times 510 - ($-$$) db 0

dw 0xAA55
