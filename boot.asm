;Nasm boot.asm -f bin -o boot.bin
;Hyper V
;UltraISO
;wxHexEditor

[ORG 0x7C00]  ;postion of memory 31744 - required to boot using BIOS

	mov [BOOT_DISK], dl ; storage the disk number that boot was load

	mov bp, 0x7c00
	mov sp, bp

	call ReadDisk
	jmp PROGRAM_SPACE

	jmp $

	%include "print.asm"
	%include "diskread.asm"

	
;The $ symbol denotes the current address of the statement
;$$ denotes the address of the beginning of current section.
;Complete 510 bytes
times 510-($-$$) db 0


;End signatura of MBR 
dw 0xAA55
