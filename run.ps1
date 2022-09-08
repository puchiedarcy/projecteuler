$problemNumber = $args[0]

ca65 $problemNumber/pe$problemNumber.asm -o $problemNumber/pe$problemNumber.o
ld65 -o $problemNumber/pe#0x6000.bin -C ./resources/apple2bin.cfg $problemNumber/pe$problemNumber.o
Remove-Item $problemNumber/pe$problemNumber.o
Copy-Item ./resources/empty.dsk $problemNumber/pe$problemNumber.dsk
diskm8 -with-disk $problemNumber/pe$problemNumber.dsk -file-put $problemNumber/pe#0x6000.bin
Remove-Item $problemNumber/pe#0x6000.bin
applewin -d1 $problemNumber/pe$problemNumber.dsk