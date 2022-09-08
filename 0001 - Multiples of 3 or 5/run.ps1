ca65 pe0001.asm -o pe0001.o
ld65 -o pe#0x6000.bin -C apple2bin.cfg pe0001.o
Remove-Item pe0001.o
Copy-Item empty.dsk pe0001.dsk
diskm8 -with-disk pe0001.dsk -file-put pe#0x6000.bin
Remove-Item pe#0x6000.bin
applewin -d1 pe0001.dsk