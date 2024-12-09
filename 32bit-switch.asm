[bits 16]
switch_to_pm:
    cli ; 1. disable interrupts

    lgdt [gdt_descriptor] ; 2. load the GDT descriptor
    call pic_remaping
    lidt [idt_start]

    mov eax, cr0
    or eax, 0x1 ; 3. set 32-bit mode bit in cr0
    mov cr0, eax

    jmp CODE_SEG:init_pm ; 4. far jump by using a different segment

[bits 32]
init_pm: ; we are now using 32-bit instructions
    mov ax, DATA_SEG ; 5. update the segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    xor ax, ax
    mov gs, ax
    mov ax, DATA_SEG 

    mov bp, 0x7C00
	mov sp, bp
    
    ; (upper left corner of screen)
	mov byte [gs:0xB8000],'H'
	mov byte [gs:0xB8002],'e'
	mov byte [gs:0xB8004],'l'
	mov byte [gs:0xB8006],'l'
	mov byte [gs:0xB8008],'o'
    
    sti
; try an interrupt
	;int 0x20


    mov ebp, 0x90000 ; 6. update the stack right at the top of the free space
    mov esp, ebp

    call BEGIN_PM ; 7. Call a well-known label with useful code
