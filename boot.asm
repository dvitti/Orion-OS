;Nasm boot.asm -f bin -o boot.bin
;Hyper V
;UltraISO
;wxHexEditor

[ORG 0x7C00]  ;postion of memory 31744 - required to boot using BIOS

	xor ax, ax
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

	mov bp, 0x7C00
	mov sp, bp
	
	mov [BOOT_DISK], dl ; storage the disk number that boot was load


	call ReadDisk
	jmp PROGRAM_SPACE

	jmp $

	%include "print/boot_sect_print.asm"
	%include "diskread/diskread.asm"


;The $ symbol denotes the current address of the statement
;$$ denotes the address of the beginning of current section.
;Complete 510 bytes
times 510-($-$$) db 0


;End signatura of MBR 
dw 0xAA55
