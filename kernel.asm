[org 0x7E00] ; bootloader offset

    mov bp, 0x9000 ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
	call print ; This will be written after the BIOS messages
	;mov dx, init_pm
	;call print_hex	
    
    call switch_to_pm
    jmp $ ; this will actually never be executed

%include "print/boot_sect_print.asm"
%include "print/boot_sect_print_hex.asm"
%include "gdt/32bit-gdt.asm"
%include "print/32bit-print.asm"
%include "32bit-switch.asm"
%include "pic/pic.asm"
%include "idt/32bit-idt.asm"

[bits 32]
BEGIN_PM: ; after the switch we will get here

    mov eax, 0
    ;div eax

    mov ebx, MSG_PROT_MODE
	call print_string_pm
    ;call print_hex_pm ; Note that this will be written at the top left corner
    jmp $

MSG_REAL_MODE db "Started in 16-bit real mode.", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0

times 2048-($-$$) db 0