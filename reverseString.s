#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 5/9/18
#Description : this program reverses my global string and prints it on the terminal.

        .option nopic
        
        .section    .data
        .align  3
.LC0:   .string "string"
        
        .text
        .align 1
        .globl main
        .type main, @function
 
main:
        la      t1, .LC0
len:    lb      t2, 0(t1)           #loop to calculate the length of the string(the pointer to the last character of the string
        addi    t1, t1, 1
        bne     t2, x0, len         #loop till the read character is null
        addi    t1, t1, -2          #since t1 would be pointing to the character after the null character
        la      t0, .LC0
swap:   lb      t2, 0(t0)           
        lb      t3, 0(t1)
        sb      t2, 0(t1)
        sb      t3, 0(t0)           #these four lines read character from the beginning and end of the string and swap them
        addi    t0, t0, 1           #decrementing the upper pointer
        addi    t1, t1, -1          #incrementing the lower pointer
        blt     t0, t1, swap        #branch till the lower pointer is less than the upper pointer
        la      a0, .LC0
        call    puts
        call    exit
