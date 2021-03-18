    .global loop_mod_plus
    .global loop_mod_minus

loop_mod_plus:

    CMP R0, R1
    BLT con
    MOV R2, #100
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

con:
    BX LR
