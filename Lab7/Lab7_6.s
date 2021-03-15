    .data
    .balign 4
    get_num_1: .asciz "Number 1 :\n"
    .balign 4
    get_num_2: .asciz "Number 2 :\n"

    .balign 4
    pattern: .asciz "%d"

    .balign 4
    num_1: .word 0
    .balign 4
    num_2: .word 0

    .balign 4
    output: .asciz "Result of %d + %d = %d\n"

    .balign 4
    lr_bu: .word 0
    .balign 4
    lr_bu_2: .word 0


    .text
sum_func:
    LDR R2, addr_lr_bu_2
    STR lr, [R2]

    ADD R0, R0, R1

    @LDR lr, addr_lr_bu_2
    @LDR lr, [lr]

    BX lr

addr_lr_bu_2: .word lr_bu_2



    .global main
main:
    LDR R1, addr_lr_bu
    STR lr, [R1]

    LDR R0, addr_get_num_1
    BL printf

    LDR R0, addr_pattern
    LDR R1, addr_num_1
    BL scanf

    LDR R0, addr_get_num_2
    BL printf

    LDR R0, addr_pattern
    LDR R1, addr_num_2
    BL scanf


    @ ADDITION

    LDR R0, addr_num_1
    LDR R0, [R0]
    LDR R1, addr_num_2
    LDR R1, [R1]
    BL sum_func

    @ RETURN R0

    MOV R3, R0

    LDR R0, addr_output     @string output
    LDR R1, addr_num_1
    LDR R1, [R1]
    LDR R2, addr_num_2
    LDR R2, [R2]
    BL printf

    LDR lr, addr_lr_bu
    LDR lr, [lr]
    BX lr

    addr_get_num_1: .word get_num_1
    addr_get_num_2: .word get_num_2
    addr_pattern:   .word pattern
    addr_num_1:     .word num_1
    addr_num_2:     .word num_2
    addr_output:    .word output
    addr_lr_bu:     .word lr_bu

    .global printf
    .global scanf




