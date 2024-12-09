;----------------------------------------
;-  Setup IDT   -
;----------------------------------------
[bits 32]
idt_start:
irq0:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq1:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq2:
        dw isr0
        dw 0x0008
        db 0x0008
        db 0x8E
        dw 0x0008
irq3:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq4:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq5:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq6:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq7:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq8:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq9:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq10:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq11:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq12:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq13:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq14:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq15:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq16:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq17:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq18:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq19:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq20:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq21:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq22:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq23:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq24:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq25:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq26:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq27:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq28:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq29:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq30:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq31:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq32:
        dw 0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq33:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq34:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq35:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq36:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq37:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq38:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq39:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq40:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq41:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq42:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq43:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq44:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq45:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq46:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
irq47:
        dw isr0
        dw CODE_SEG
        db 0
        db 10001110b
        dw 0x0
idt_end:
 
 
idt_point:
        dw idt_end - idt_start - 1
        dd idt_start
 
isr0:
        push dword 0 ; exception number
        push gs ; push segment registers
        push fs ;
        push es ;
        push ds ;
        pusha ; push GP registers
        mov ax,gdt_kernel_data ; put known-good values...
        mov ds,ax ; ...in segment registers
        mov es,ax ;
        mov fs,ax ;
        mov gs,ax ;
        mov eax,esp ;
        push eax ; push pointer to regs_t
                ;call interrupt
        pop eax
        popa ; pop GP registers
        pop ds ; pop segment registers
        pop es
        pop fs
        pop gs
        add esp,8 
    iret           ; pops 5 things at once: CS, EIP, EFLAGS, SS, and ESP

