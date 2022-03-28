
# 章节目录: ch

%.bin: %.asm
	nasm $< -o $@

master.img: ch$(ch)/c$(ch)_mbr.bin
	bximage -func=create -hd=16M -q master.img
	dd if=$< of=$@ bs=512 count=1 conv=notrunc

.PHONY:bochs
bochs: master.img
	bochs -q -unlock

.PHONY:clean
clean:
	rm -rf master.img
	rm -rf bx_enh_dbg.ini
	rm -rf *.bin