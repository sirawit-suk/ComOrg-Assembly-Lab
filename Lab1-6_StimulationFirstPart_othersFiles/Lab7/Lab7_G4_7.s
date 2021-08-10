.data

.balign 4
question: .asciz "Enter 2 number : "

.balign 4
pattern: .asciz "%d %d"

.balign 4
num_1: .word 0

.balign 4
num_2: .word 0

.balign 4
output: .asciz "%c is grater than %c\n"

.balign 4
lr_bu: .word 0

.text

.global scanf
.global printf
.global main

main:
    LDR R1, =lr_bu
    STR lr, [R1]

    LDR R0, =question
    BL printf

    LDR R0, =pattern
    LDR R1, =num_1
    LDR R2, =num_2
    BL scanf

    LDR R1, =num_1
    LDR R1, [R1]
    LDR R2, =num_2
    LDR R2, [R2]
    CMP R1, R2
    BGT num_1_greater
    B  num_2_greater

 num_1_greater:   
    LDR R0, =output
    MOV R1, #65
    MOV R2, #66
    BL printf
    BL end


 num_2_greater:   
    LDR R0, =output
    MOV R1, #65
    MOV R2, #66
    BL printf

 end:
    LDR lr, =lr_bu
    LDR lr, [lr]
    BX lr
