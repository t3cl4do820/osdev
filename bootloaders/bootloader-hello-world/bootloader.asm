; usando o modo grafico!
[BITS 16]
[ORG 0x7C00]

; modo de texto usa dois registradores: ah e al -> somados dao 16 bits

call set_video_mode
call colors
call loop


colors:
    mov al, 0x01 ; cor do pixel 
    mov bh, 0x00 ; numero da pagina
    mov cx, 0x00 ; posicao x
    mov dx, 0x00 ; posicao y
    int 0x10 




set_video_mode:
    ; definindo o modo de video 
    mov ah, 0 ; movendo o ah para o valor 0, ou 0x00
    mov al, 0x13 ; eh o valor 19 em decimal, definindo o modo de video para 320x200 256 cores
    int 0x10
    ret

loop:
    ; funcao para 'pintar' na tela
    mov ah, 0x0C
    int 0x10

    jmp loop

times 510 - ($-$$) db 0
dw 0xAA55

