.globl argmax

.text
# =================================================================
# FUNCTION: Maximum Element First Index Finder
#
# Scans an integer array to find its maximum value and returns the
# position of its first occurrence. In cases where multiple elements
# share the maximum value, returns the smallest index.
#
# Arguments:
#   a0 (int *): Pointer to the first element of the array
#   a1 (int):  Number of elements in the array
#
# Returns:
#   a0 (int):  Position of the first maximum element (0-based index)
#
# Preconditions:
#   - Array must contain at least one element
#
# Error Cases:
#   - Terminates program with exit code 36 if array length < 1
# =================================================================
argmax:
    li t6, 1
    blt a1, t6, handle_error   

    li t1, 0
    li t2, 0
loop_start:
    # TODO: Add your own implementation    
    beqz a1, finished    
    addi a1, a1, -1
    lw t0, 0(a0)
    bge t1, t0, not_the_max #if t1 >= t0, t0 is not the max
    mv t1, t0
    mv t3, t2

    addi t2, t2, 1
    addi a0, a0, 4
    j loop_start

not_the_max:
    addi t2, t2, 1
    addi a0, a0, 4
    j loop_start

finished:
    mv a0, t3
    ret

handle_error:
    li a0, 36
    j exit
