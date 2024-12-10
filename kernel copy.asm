[BITS 16]
[ORG 0x7C00]

start:
    cli                    ; Disable interrupts
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00         ; Initialize stack pointer

    ; Load GDT
    lgdt [gdt_descriptor]

    ; Enable A20 line
    in al, 0x92
    or al, 2
    out 0x92, al

    ; Switch to protected mode
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    jmp CODE_SEG:init_pm

[BITS 32]

init_pm:
    ; Initialize data segments
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    ; Write "A" to VGA memory
    mov byte [VIDEO_MEMORY], 'A'  ; Character 'A'
    mov byte [VIDEO_MEMORY + 1], 0x07  ; Attribute byte (white on black)

hang:
    jmp hang

gdt_start:
gdt_null:
    dd 0x0
    dd 0x0

gdt_code:
    dw 0xFFFF
    dw 0x0
    db 0x0
    db 10011010b
    db 11001111b
    db 0x0

gdt_data:
    dw 0xFFFF
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

VIDEO_MEMORY equ 0xB8000

times 510-($-$$) db 0
dw 0xAA55