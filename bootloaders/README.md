# Bootloaders

## What's the MBR

Master Boot Record (Registro mestre de inicializacao) eh um setor especial localizado no primeiro bloco de um disco rigido (como HDs e SSDs), ele tem duas principais funcoes:

- Inicializacao do sistema, quarda um arquivo (bootloader), diz onde encontrar um sistema operacional e como carrega-lo

- Tabela de particoes, guarda informacoes de como o disco esta dividido (onde cada particao comeca/termina e qual o seu tipo)

O bootloader eh um programa/arquivo gravado dentro do MBR


### Caracteristicas

O MBR suporta discos com ate 2T de armazenamento, mais do que isso o resto do disco fica inutil. Eh utilizado em sistemas com BIOS, computadores mais modernos usam GPT (UEFI)



