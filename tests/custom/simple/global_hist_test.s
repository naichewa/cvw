.section .text
.globl oneLoopTest
.type oneLoopTest, @function
oneLoopTest:
	li t1, 0
	li t2, 30

        mv t3, t1
        mv t4, t2
oneLoopTest1:
	# instruction
	addi t3, t3, 1
        li   t5, 10      # filler instructions
        li   t6, 100
        li   a0, 1000
        li   a1, 10000
	bne t3, t4, oneLoopTest1     # this branch toggles between taken and not taken.

        mv t3, t1
        mv t4, t2
oneLoopTest2:
	# instruction
	addi t3, t3, 1
        li   t5, 10      # filler instructions
        li   t6, 100
        li   a0, 1000
	bne t3, t4, oneLoopTest2     # this branch toggles between taken and not taken.

        mv t3, t1
        mv t4, t2
oneLoopTest3:
	# instruction
	addi t3, t3, 1
        li   t5, 10      # filler instructions
        li   t6, 100
	bne t3, t4, oneLoopTest3     # this branch toggles between taken and not taken.

        mv t3, t1
        mv t4, t2
oneLoopTest4:
	# instruction
	addi t3, t3, 1
        li   t5, 10      # filler instructions
	bne t3, t4, oneLoopTest4     # this branch toggles between taken and not taken.

        mv t3, t1
        mv t4, t2
oneLoopTest5:
	# instruction
	addi t3, t3, 1
	bne t3, t4, oneLoopTest5     # this branch toggles between taken and not taken.
        
	ret

.section .text
.globl global_hist_6_space_test
.type global_hist_6_space_test, @function
global_hist_6_space_test:
	li t1, 1
	li t2, 200
	li t3, 0
	li t4, 1

loop_6:
	# instruction
	addi t3, t3, 1
	addi t3, t3, 1
	addi t3, t3, 1		
	addi t3, t3, 1		
	addi t3, t3, 1		
	addi t3, t3, 1		
	beqz t4, zero_6     # this branch toggles between taken and not taken.
	li t4, 0
	j one_6
zero_6:
	li t4, 1
	addi t3, t3, 1
	addi t3, t3, 1
	addi t3, t3, 1
	add t1, t1, t4
	
one_6:
	addi t3, t3, 1		
	addi t3, t3, 1		
	addi t3, t3, 1		
	addi t3, t3, 1		
	addi t2, t2, -1
	bnez t2, loop_6

	ret

.section .text
.globl global_hist_4_space_test
.type global_hist_4_space_test, @function
global_hist_4_space_test:
	li t1, 1
	li t2, 200
	li t3, 0
	li t4, 1

loop_4:
	# instruction
	addi t3, t3, 1
	addi t3, t3, 1
	addi t3, t3, 1		
	addi t3, t3, 1		
	beqz t4, zero_4     # this branch toggles between taken and not taken.
	li t4, 0
	j one_4
zero_4:
	li t4, 1
	addi t3, t3, 1
	add t1, t1, t4
	
one_4:
	addi t3, t3, 1		
	addi t2, t2, -1
	bnez t2, loop_4

	ret

.section .text
.globl global_hist_3_space_test
.type global_hist_3_space_test, @function
global_hist_3_space_test:
	li t1, 1
	li t2, 200
	li t3, 0
	li t4, 1

loop_3:
	# instruction
	addi t3, t3, 1
	addi t3, t3, 1
	addi t3, t3, 1		
	addi t3, t3, 1		
	beqz t4, zero_3     # this branch toggles between taken and not taken.
	li t4, 0
	j one_3
zero_3:
	li t4, 1
	addi t3, t3, 1
	add t1, t1, t4
	
one_3:
	addi t3, t3, 1		
	addi t2, t2, -1
	bnez t2, loop_3

	ret


.section .text
.globl global_hist_2_space_test
.type global_hist_2_space_test, @function
global_hist_2_space_test:
	li t1, 1
	li t2, 200
	li t3, 0
	li t4, 1

loop_2:
	# instruction
	addi t3, t3, 1
	addi t3, t3, 1
	beqz t4, zero_2     # this branch toggles between taken and not taken.
	li t4, 0
	j one_2
zero_2:
	li t4, 1
	add t1, t1, t4
	
one_2:
	addi t2, t2, -1
	bnez t2, loop_2

	ret

.section .text
.globl global_hist_1_space_test
.type global_hist_1_space_test, @function
global_hist_1_space_test:
	li t1, 1
	li t2, 200
	li t3, 0
	li t4, 1

loop_1:
	# instruction
	addi t3, t3, 1
	beqz t4, zero_1     # this branch toggles between taken and not taken.
	li t4, 0
	j one_1
zero_1:
	li t4, 1
	add t1, t1, t4
	
one_1:
	addi t2, t2, -1
	bnez t2, loop_1

	ret
	
.section .text
.globl global_hist_0_space_test
.type global_hist_0_space_test, @function
global_hist_0_space_test:
	li t1, 1
	li t2, 200
	li t3, 0
	li t4, 1

loop_0:
	# instruction
	beqz t4, zero_0     # this branch toggles between taken and not taken.
	li t4, 0
	j one_0
zero_0:
	li t4, 1
	add t1, t1, t4
	
one_0:
	addi t2, t2, -1
	bnez t2, loop_0

	ret
	
