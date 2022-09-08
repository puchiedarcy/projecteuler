$problemNumber = $args[0]
$prefix = "pe$problemNumber/pe$problemNumber"

ca65 "$prefix.asm" -o "$prefix.o"
if(-Not $?) {
    Write-Host "ca65 failure"
    Exit 1
}

ld65 -C "./resources/apple2bin.cfg" "$prefix.o"
if(-Not $?) {
    Write-Host "ld65 failure"
    Exit 1
}

Copy-Item ./resources/empty.dsk "$prefix.dsk"
diskm8 -with-disk "$prefix.dsk" -file-put "ram#0x0C00.bin"
diskm8 -with-disk "$prefix.dsk" -file-put "prg#0x6000.bin"

Remove-Item "$prefix.o"
Remove-Item "*.bin"

applewin -d1 "$prefix.dsk"

Exit 0