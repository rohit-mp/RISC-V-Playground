#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 5/9/18
#Description : this program initializes a contiguous chunk of memory containing 10 2 digit numbers and calculates their sum and stores it in their x5.

        .option nopic

        .globl arr
        .data
        .align 2
        .type arr, @object
        .size arr, 40
arr:    .word 10
        .word 11
        .word 12
        .word 13
        .word 14
        .word 15
        .word 16
        .word 17
        .word 18
        .word 19
        
        .section    .rodata
        .align 3
.LC0:   .string "%d\n"

        .text
        .align 1
        .globl  main
        .type   main, @function
main:
        li      t1, 10              #using register t1 to keep track of the length of the array
        la      a0, arr             
        li      a1, 0               #using register a1 to store the sum
loop:   ld      t0, 0(a0)           #t0 is the temporary register used to store individual array elements
        add     a1, a1, t0          #calculating the sum
        addi    a0, a0, 4           #incrementing the array pointer    
        addi    t1, t1, -1          #decrementing the number of array elements left to be added
        bgt     t1, zero, loop      #branch till more than 0 elements are left to be added
        la      a0, .LC0
        call    printf
        call    exit
