#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 5/9/18
#Description : this program has a function which recieves the address of an array and its length and calculates the sum and returns it to the main function.

.option nopic

        .globl arr
        .data
        .align 3
        .type arr, @object
        .size arr, 12
arr:    .word 1
        .word 2
        .word 3

        .text
        .align 1
        .globl add
        .type add, @function

add:    
        xor     t1, t1, t1          #t1 is used to store the sum
        li      t0, 0               #t0 is used as the counter variable
loop:   lw      t2, 0(a0)           #loading the array elements
        add     t1, t1, t2          
        addi    a0, a0, 4           #incrementing the array pointer
        addi    t0, t0, 1           #incrementing the counter
        blt     t0, a1, loop        #branch till counter is less than size of array
        mv      a0, t1
        jr      ra  

        .section    .rodata
        .align 3
.LC0:   .string "%d\n"
        
        .text
        .align 1
        .globl main
        .type main, @function

main:
        la      a0, arr             #loading the address of the array 
        li      a1, 3               #loading the length of the array
        call    add                 
        divw    a0, a0, a1          #calculating the average
        mv      a1, a0              
        la      a0, .LC0
        call    printf
        call    exit


 
        
