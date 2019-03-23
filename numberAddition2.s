#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 4/9/18
#Description : the program loads a 64bit constant(not from the location pointed to by the global pointer as loading from 0(gp) gives a page fault error, adds it with a 64bit constant from the first memory location of data section and saves it in the 100th doubleword of the data segment.

        .option nopic

        .globl a
        .align 3
        .type a, @object
        .size a, 4
a:      .dword 10

        .text
        .align 1
        .globl main
        .type main, @function

main:   
        li      t0, 20
        sd      t0, -8(sp)      #storing the value 20 in the first doubleword space in the stack
        la      t1, a           #loading the address into register t0
        ld      t1, 0(t1)       #loading the value from the address stored in register t0
        add     t2, t1, t0      
        sd      t2, -800(sp)    #storing the added value in the 100th doubleword region in the stack
        call    exit
