    .data
    .balign 4
question: .asciz "What is your favorite number?"

    .balign 4
message: .asciz "%d Wow amazing!!xxxxxxxxx \n"

    .balign 4
pattern: .asciz "%d"

    .balign 4
number: .word 0

    .balign 4
lr_bu: .word 0




    .text
    .global main
    .func main

main:
    @LDR R1, addr_lr_bu
    @STR lr, [R1]            @ backup lr to lr_bu

    LDR R0, addr_question   @ load question to R0
    BL printf               @ print question

    LDR R0, addr_pattern    @ load pattern
    LDR R1, addr_number     @ load number
    BL scanf                @ waiting to type

    LDR R0, addr_message    @ load message
    LDR R1, addr_number     @ load number
    LDR R1, [R1]            @ get value number
    BL printf               @ print message

    @LDR lr, addr_lr_bu      @ load back to lr
    @LDR lr, [lr]            @ get value lr
    BX lr                   @ return (end)

addr_question:  .word question
addr_message:	.word message
addr_pattern:	.word pattern
addr_number:	.word number
addr_lr_bu:	    .word lr_bu

.global printf
.global scanf

