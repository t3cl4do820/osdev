[BITS 16] ; informando ao NASM que esse programa vai ser compilado para um binario de 16 bits
[ORG 0x7C00] ; o programa eh carregado comecando nesse endereco de memoria (0x7C00)

; loop para manter o bootloader 'congelado'
loop:
    jmp loop

; aqui ele preenche com bytes o resto do arquivo para que de 510 bytes + 2 da assinatura
times 510 - ($-$$) db 0

; esse arquivo PRECISA ter 512 bytes, o codigo precisa ter 510 e a assinatura que significa que esse arquivo eh bootavel ou nao
dw 0xAA55
