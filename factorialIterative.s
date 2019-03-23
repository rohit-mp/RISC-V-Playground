#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 5/9/18
#Description : calculates the factorial of a random chosen number iteratively

        .option nopic
        
        .section        .rodata
        .align 3
.LC0:   .string "%d\n"
        
        .text
        .align  1
        .globl  main
        .type   main, @function

main:
        li      t0, 4               # calculating 4 factorial
        li      a0, 1
here:   mul     a0, a0, t0
        addi    t0, t0, -1          #decrementing the number
        bgt     t0, zero, here      #checking till it becomes zero
        mv      a1, a0
        la      a0, (.LC0)
        call    printf
        call    exit
