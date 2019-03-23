#Done by Rohit M P - 171CO136 and Shashwatha Mitra G B - 171CO144
#written on 6/9/18
#Description : program to scan for the elements of the two matrices, print both and print the product of the two matrices

	.option nopic
	.globl a
	.data
	.align 2
	.type a,@object
#matrix a[2][2]
a:
	.space 16
	.globl b
	.data
	.align 2
	.type b,@object
#matrix b[2][2]
b:
	.space 16
	.globl c
	.data
	.align 2
	.type c,@object
c:
	.space 16
	.text
	.align 1
	.globl mul
	.type mul,@function
mul: 								#arguements a0=address of a[0][0], a1=address of b[0][0]
	addi sp,sp,-16
	sd ra,8(sp)
	sd s0,0(sp)
	addi s0,sp,16
	li t3,0							#i=0
	li t6,2							#order of square matrices
	loop1:
		li t4,0						#j=0	
		loop2:
			li t5,0					#k=0
			li a5,0
			loop3:
				mv t0,a0			#address of a[0][0]
				mv t1,a1			#address of b[0][0]
				la t2,c				#address of c[0][0]
				slli t3,t3,3		#calculating offset (2*i)*4
		  		slli t4,t4,2		#calculating offset j*4
		  		add a7,t3,t4		#a7=(2*i+j)*4
		  		add t2,t2,a7		#(c+2*i+j)
		  		slli t5,t5,2		#calculating offset k*4
		  		add a7,t3,t5		#a7=(2*i+k)*4
		  		add t0,t0,a7		#(a+2*i+k)
		  		slli t5,t5,1		#caluclating offset (2*k)*4
		  		add a7,t5,t4		#a7=(2*k+j)*4
		  		add t1,t1,a7		#(b+2*k+j)
		  		lw a3,0(t0)			#a3=a[i][k]
		  		lw a4,0(t1)			#a4=b[k][j]
		  		mul a3,a3,a4		#a3=a[i][k]*b[k][j]
		  		add a5,a5,a3		#a5=a5+a[i][k]*b[k][j]
		  		sw a5,0(t2)			#c[i][j]=a5
		  		srli t5,t5,3		#brings back k to 0/1
		  		addi t5,t5,1		#k++
		  
		srli t4,t4,2		#brings back j to 0/1
		  		srli t3,t3,3		#brings back i to 0/1
		  		blt t5,t6,loop3		#while(k<2)
		  	addi t4,t4,1			#j++
		  	blt t4,t6,loop2			#while(j<2)
		addi t3,t3,1				#i++
		blt t3,t6,loop1				#while(i<2)
	ld s0,0(sp)
	ld ra,8(sp)
	addi sp,sp,16
	jr ra
									#returns to main
	.section	.rodata
	.align 3
.lc0:
	.string "%d %d\n%d %d\n"
.lc1:
	.string "Matrix A:\n"
.lc2:
	.string "Matrix B:\n"
.lc3:
	.string "Product is:\n"
    .align 3
.lc4:
    .string "%d%d%d%d"

    .align 3
.lc5:
    .string "Enter the elements of the 2 matrices"
	.text
	.align 1
	.globl main
	.type main,@function
main:
	la  a0, .lc5
    	call puts
	la  a1, a
    	addi a2, a1, 4
    	addi a3, a2, 4
    	addi a4, a3, 4
    	la a0, .lc4
    	call scanf
	la  a1, b
    	addi a2, a1, 4
    	addi a3, a2, 4
    	addi a4, a3, 4
    	la a0, .lc4
    	call scanf
	la a0,a 						#loading address of a to pass as first parameter
	la a1,b 						#loading address of b to pass as second parameter
	call mul
	lui a5,%hi(.lc1)				#loading address to print "Matrix A:\n"
	addi a0,a5,%lo(.lc1)
	call printf
	nop
	la t0,a
	lw a1,0(t0)						#these four statements are used to print the elements of the matrix A
	lw a2,4(t0)
	lw a3,8(t0)
	lw a4,12(t0)
	lui a5,%hi(.lc0)				
	addi a0,a5,%lo(.lc0)
	call printf						
	nop
	lui a5,%hi(.lc2)				#loading address to print "Matrix B:\n"
	addi a0,a5,%lo(.lc2)
	call printf						#calling printf
	nop
	la t0,b
	lw a1,0(t0)						#these four statements are used to print the elements of the matrix B
	lw a2,4(t0)						#
	lw a3,8(t0)						#
	lw a4,12(t0)					#
	lui a5,%hi(.lc0)				
	addi a0,a5,%lo(.lc0)
	call printf						
	nop
	lui a5,%hi(.lc3)				#loading address for printing global string "Product of two matrices:\n"
	addi a0,a5,%lo(.lc3)
	call printf						#calling printf
	nop
	la t0,c
	lw a1,0(t0)						#these four statements are used to print the elements of the matrix C
	lw a2,4(t0)
	lw a3,8(t0)
	lw a4,12(t0)
	lui a5,%hi(.lc0)				#loading address for printing global string
	addi a0,a5,%lo(.lc0)
	call printf						#calling printf
	call exit						#calling exit
