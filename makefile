

build:
	nasm -f bin boot.asm -o boot.bin
	nasm -f bin kernel.asm -o kernel.bin
	cat boot.bin kernel.bin > so.bin

run:
	qemu-system-x86_64 -drive format=raw,file="so.bin",index=0,if=ide -m 128M