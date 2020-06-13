#nasm -f elf64 -o main.o main.s
#ld main.o -o main
#./main

echo $1

nasm -f elf64 $1.s -o $1.o
ld $1.o -o $1
./$1

rm $1.o