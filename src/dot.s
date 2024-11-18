.globl dot

.text
# =======================================================
# FUNCTION: Strided Dot Product Calculator
#
# Calculates sum(arr0[i * stride0] * arr1[i * stride1])
# where i ranges from 0 to (element_count - 1)
#
# Args:
#   a0 (int *): Pointer to first input array
#   a1 (int *): Pointer to second input array
#   a2 (int):   Number of elements to process
#   a3 (int):   Skip distance in first array
#   a4 (int):   Skip distance in second array
#
# Returns:
#   a0 (int):   Resulting dot product value
#
# Preconditions:
#   - Element count must be positive (>= 1)
#   - Both strides must be positive (>= 1)
#
# Error Handling:
#   - Exits with code 36 if element count < 1
#   - Exits with code 37 if any stride < 1
# =======================================================
dot:
    li t0, 1
    blt a2, t0, error_terminate  
    blt a3, t0, error_terminate   
    blt a4, t0, error_terminate  

    li t0, 0            
    li t1, 0         

loop_start:
    bge t1, a2, loop_end
    # TODO: Add your own implementation    
    lw t2, 0(a0)
    lw t3, 0(a1)
    addi t1, t1, 1
    mv t4, a3
    mv t5, a4

skip_distance_1:
    beqz t4, skip_distance_2
    addi a0, a0, 4
    addi t4, t4, -1
    j skip_distance_1

skip_distance_2:
    beqz t5, d_loop
    addi a1, a1, 4
    addi t5, t5, -1
    j skip_distance_2

d_loop:
    beqz t3, loop_start
    add t0, t2, t0
    addi t3, t3, -1
    j d_loop


loop_end:
    mv a0, t0
    jr ra

error_terminate:
    blt a2, t0, set_error_36
    li a0, 37
    j exit

set_error_36:
    li a0, 36
    j exit
