[ORG 0x7E00] 

mov bx, KernelMsg
call PrintString

jmp $

%include "print.asm"

KernelMsg:
    db "Kernel loading", 0

times 2048-($-$$) db 0