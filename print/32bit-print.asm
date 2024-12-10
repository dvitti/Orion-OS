[bits 32] ; using 32-bit protected mode

; this is how constants are defined
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f ; the color byte for each character

print_string_char:
    pusha
    mov edx, VIDEO_MEMORY

    mov al, 0x42
    mov ah, WHITE_ON_BLACK
    mov [edx], ax ; store character + attribute in video memory

    popa
    ret


print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx] ; [ebx] is the address of our character
    mov ah, WHITE_ON_BLACK

    cmp al, 0 ; check if end of string
    je print_string_pm_done

    mov [edx], ax ; store character + attribute in video memory
    add ebx, 1 ; next char
    add edx, 2 ; next video memory position

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret


; receiving the data in 'dx'
; For the examples we'll assume that we're called with dx=0x1234
print_hex_pm:
    pusha

    mov ecx, 0 ; our index variable

; Strategy: get the last char of 'dx', then convert to ASCII
; Numeric ASCII values: '0' (ASCII 0x30) to '9' (0x39), so just add 0x30 to byte N.
; For alphabetic characters A-F: 'A' (ASCII 0x41) to 'F' (0x46) we'll add 0x40
; Then, move the ASCII byte to the correct position on the resulting string
hex_loop_pm:
    cmp cx, 8 ; loop 8 times
    je end_pm
    
    ; 1. convert last char of 'dx' to ascii
    mov ax, dx ; we will use 'ax' as our working register
    and ax, 0x000f ; 0x1234 -> 0x0004 by masking first three to zeros
    add al, 0x30 ; add 0x30 to N to convert it to ASCII "N"
    cmp al, 0x39 ; if > 9, add extra 8 to represent 'A' to 'F'
    jle step2_pm
    add al, 7 ; 'A' is ASCII 65 instead of 58, so 65-58=7

step2_pm:
    ; 2. get the correct position of the string to place our ASCII char
    ; bx <- base address + string length - index of char
    mov bx, HEX_OUT_PM + 9 ; base + length
    sub bx, cx  ; our index variable
    mov [bx], al ; copy the ASCII char on 'al' to the position pointed by 'bx'
    ror edx, 4 ; 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234

    ; increment index and loop
    add cx, 1
    jmp hex_loop_pm

end_pm:
    ; prepare the parameter and call the function
    ; remember that print receives parameters in 'bx'
    mov ebx, HEX_OUT_PM
    call print_string_pm

    popa
    ret

HEX_OUT_PM:
    db '0x80000008',0 ; reserve memory for our new string
	
