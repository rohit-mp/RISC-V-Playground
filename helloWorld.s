#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 5/9/18
#Description : this is a simple hello world program

        .option nopic
        .section        .rodata

        .align 3
.LC0:   .string "Hello World"
        
        .text
        .align 1
        .globl main
        .type main, @function

main:
        la      a0, .LC0        #storing the address of the string in register a0
        call    puts
        call    exit
