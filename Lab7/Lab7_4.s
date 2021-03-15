    .data
numbers: .byte 1,2,3,4,5

    .text
    .global main
main:
    LDR R3, =numbers
    LDRB R0, [R3, #2]

end:
    BX LR
