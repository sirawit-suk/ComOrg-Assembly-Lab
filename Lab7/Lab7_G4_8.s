 @ modulation
 @ for A can be positive or negative integer
 @ and B is positive only

    .data
    .balign 4
question:   .asciz  "Enter 2 Numbers: "
    .balign 4
pattern:    .asciz  "%d %d"
    .balign 4
output:     .asciz  "Result: %d %% %d = %d"
    .balign 4
num1:       .word   0
    .balign 4
num2:       .word   0
    .balign 4
lr_bu:      .word   0

    .text
    .global main
    .global printf
    .global scanf

loop_mod_plus:

    CMP R0, R1
    BLT con
    SUB R0, R0, R1
    B loop_mod_plus

loop_mod_minus:
    MVN R0, R0
    CMP R0, R1
    BLT invert
    SUB R0, R0, R1
    MVN R0, R0
    B loop_mod_minus

invert:
    MVN R0, R0
    ADD R0, R0, #1
    B con

main:
    LDR R0, =lr_bu
    STR lr, [R0]

    LDR R0, =question
    BL  printf

    LDR R0, =pattern
    LDR R1, =num1
    LDR R2, =num2
    BL  scanf

    LDR R0, =num1
    LDR R0, [R0]
    LDR R1, =num2
    LDR R1, [R1]
    CMP R0, #0
    BGE loop_mod_plus

    SUB R0, R0, #1
    BL loop_mod_minus

con:
    MOV R3, R0

    LDR R0, =output
    LDR R1, =num1
    LDR R1, [R1]
    LDR R2, =num2
    LDR R2, [R2]
    BL printf

    LDR lr, =lr_bu
    LDR lr, [lr]

    BX lr





