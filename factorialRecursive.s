#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 5/9/18
#Description : calculates the factorial of a random chosen number recursievly

        .option nopic

        .text
        .align  1
        .globl  rec
        .type   rec, @function
rec:    
        addi    sp, sp, -8
        sd      ra, 0(sp)               #storing the return address for each call
        ble     a0, zero, here          #call recursively till a0(which contains the number) becomes zero
        mul     t1, t1, a0              #multiplying to find the factorial
        addi    a0, a0, -1              #decrementing the number
        call    rec                 
here:   ld      ra, 0(sp)               #loading the stored return address
        addi    sp, sp, 8               
        jr ra

        .section        .rodata
        .align 3
.LC0:   .string "%d\n"

        .text
        .align  1
        .globl main
        .type   main, @function
main:
        addi    sp, sp, -8
        sd      ra, 0(sp)
        li      a0, 4                   #calculating 4 factorial
        li      t1, 1                   #t1 is going to be used to store the multiplied value
        call    rec
        mv      a1, t1
        la      a0, (.LC0)
        call    printf
        call    exit
             
                
