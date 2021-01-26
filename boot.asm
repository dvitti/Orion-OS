;Nasm boot.asm -f bin -o boot.bin
;Hyper V
;UltraISO
;wxHexEditor

[ORG 0x7C00] ;postion of memory 31744 - required to boot using BIOS

; Initializar Video Mode - Regs AH e AL
mov AH, 0x00 ; 0 dec
mov AL, 0x13 ; 19 dec
int 0x10 ; 320x200 pixel

; Parameters
mov al, 0x01 ; Color
mov bh, 0x00 ; Page number
mov cx, 0x00 ; Position X axis
mov dx, 0x00 ; Position Y axis

LOOP:
	mov ah, 0x0C ; paint a pixel
	int 0x10

	inc cx ; Increment X position
	cmp cx, 0x0140 ; Check if it is in the end
	jne LOOP
	mov cx, 0x00 ; Reset X position
	inc dx ; Increment Y position
	cmp dx, 0xC8 ; Check if it is in the end
	jne LOOP
	mov dx, 0x00 ; Reset X position
	inc al ; Next Color
	cmp al, 0xFF 
	je RESETCOLOR
RESETCOLOR:
	mov al,0x00
	
	jmp LOOP
	
;The $ symbol denotes the current address of the statement
;$$ denotes the address of the beginning of current section.
;Complete 510 bytes
times 510-($-$$) db 0

;End signatura of MBR 
db 0x55
db 0x44