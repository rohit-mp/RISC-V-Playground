#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 4/9/18
#Description : this program loads two 64bit numbers from the memory, adds them and stores them in register x7

        .option nopic
        
        .globl a
        .align 3
        .type a,@object
        .size a,8
a:      .dword  10

        .globl b
        .align 3
        .type b,@object
        .size b,8
b:      .dword  20

        .text
        .align 1
        .globl main
        .type main, @function

main:
        ld      x5, a
        ld      x6, b
        add     x7, x5,x6
        call    exit
    
