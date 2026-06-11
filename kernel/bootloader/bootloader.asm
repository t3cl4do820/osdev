bits 16
org 0x7C00

start:
	
	; for security all this registers equals to 0
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov sp, 0x7A00 ; Stack Pointer

	mov si, hello
	call print_string
	call read_disk
	; A20
	; to acess 1MB of memory (protect mode need this)
	mov al, 0x92 ; fast A20, le o controlador rapido do A20
	or al, 00000010b ; liga o bit do A20
	out 0x92, al ; envia de volta -> A20 habilitado

	; GDT
	


	; jmp 0x1000 ; jump to address of the kernel
	jmp loop


read_disk:
	; what disk do we want to read? (diskNum), for example the 'n1' (number 1) of /dev/nvme0n1p1
	; CHS address: C -> Cylinder of the disk, H -> head, S -> Sector of the disk
	; to load the disk in RAM
	mov ah, 0x02 ; for read the disk
	mov al, 1 ; quantity of sectors
	mov ch, 0 ; cylinder
	mov cl, 2 ; second sector of the disk
	mov dh, 0 ; head
	mov dl, 0x80 ; drive (its a HD or something else)
	mov bx, 0x1000 ; address where the kernel will start in RAM
	int 0x13
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
