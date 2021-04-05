	#---
	# data segment
	#---
	.data
	.balign 4
intro:	.asciz	"LED blinking by wiringPi\n"
errMsg:	.asciz	"Setting up problem ... Abort!\n"
pin1:	.int	7
pin2:   .int    0
pin3:   .int    2
i:	    .int	0
duration:.int	500
OUTPUT	=1	@constant

	#---
	# text segment
	#---
	.text
	.global main
	.extern printf
	.extern wiringPiSetup
	.extern delay
	.extern digitalWrite
	.extern	pinMode

main:
    PUSH	{ip, lr}	@push link return register on stack segment
    LDR	R0, =intro
    BL	printf

    BL	wiringPiSetup
    MOV	R1, #-1
	CMP	R0, R1
	BNE	init

	LDR	R0, =errMsg
	BL	printf
	B	done

init:

    LDR	R0, =pin1
	LDR	R0, [R0]	@ pin 7
	MOV	R1, #OUTPUT	@ set to output
	BL	pinMode		@ pinMode(7,output)

    LDR	R0, =pin2
	LDR	R0, [R0]	@ pin 0
	MOV	R1, #OUTPUT	@ set to output
	BL	pinMode		@ pinMode(0,output)

    LDR	R0, =pin3
	LDR	R0, [R0]	@ pin 2
	MOV	R1, #OUTPUT	@ set to output
	BL	pinMode		@ pinMode(2,output)

	LDR	R4, =i		@i=0
	LDR	R4, [R4]
	MOV	R5, #100		@ to 100

    LDR	R0, =pin1
	LDR	R0, [R0]	@ pin 7
	MOV	R1, #0		@ swap
	BL	digitalWrite

    LDR	R0, =pin2
	LDR	R0, [R0]	@ pin 0
	MOV	R1, #0		@ swap
	BL	digitalWrite

    LDR	R0, =pin3
	LDR	R0, [R0]	@ pin 2
	MOV	R1, #0		@ swap
	BL	digitalWrite

forLoop:

	CMP	R4, R5		@ i > 10 ?
	BGT	done		@ go to done

	LDR	R0, =pin1
	LDR	R0, [R0]	@ READ 1
	BL	digitalRead
	MOV R6, R0

    LDR	R0, =pin2
	LDR	R0, [R0]	@ READ 2
	BL	digitalRead
	MOV R7, R0

    LDR	R0, =pin3
	LDR	R0, [R0]	@ READ 3
	BL	digitalRead
	MOV R8, R0


    LDR	R0, =duration
	LDR	R0, [R0]	@ 500
	BL	delay		@ delay 500
	MOV R0, R0

if1:
    CMP R6, #0
    BEQ func1
    B if2

func1:
    LDR	R0, =pin1
	LDR	R0, [R0]	@ pin 7

	MOV R6, #1

	MOV	R1, R6		@ on
	BL	digitalWrite
    B endLoop

if2:
    CMP R7, #0
    BEQ func2
    B else

func2:

    LDR	R0, =pin1
	LDR	R0, [R0]	@ pin 7

    CMP R6, #0
    BEQ semi10
    B semi11
semi10:
    MOV R6, #1
    B semi12
semi11:
    MOV R6, #0
semi12:

	MOV	R1, R6		@ swap
	BL	digitalWrite

    LDR	R0, =pin2
	LDR	R0, [R0]	@ pin 0

    MOV R7, #1

	MOV	R1, R7		@ swap
	BL	digitalWrite
    B endLoop

else:






    LDR	R0, =pin1
	LDR	R0, [R0]	@ pin 7

    CMP R6, #0
    BEQ semi1
    B semi2
semi1:
    MOV R6, #1
    B semi3
semi2:
    MOV R6, #0
semi3:
	MOV	R1, R6		@ swap
	BL	digitalWrite







    LDR	R0, =pin2
	LDR	R0, [R0]	@ pin 0

CMP R7, #0
    BEQ semi4
    B semi5
semi4:
    MOV R7, #1
    B semi6
semi5:
    MOV R7, #0
semi6:

	MOV	R1, R7		@ swap
	BL	digitalWrite







    LDR	R0, =pin3
	LDR	R0, [R0]	@ pin 2

CMP R8, #0
    BEQ semi7
    B semi8
semi7:
    MOV R8, #1
    B semi9
semi8:
    MOV R8, #0
semi9:


	MOV	R1, R8  	@ swap
	BL	digitalWrite



endLoop:
	ADD	R4, #1		@ i++
	B	forLoop		@ go back to start loop

done:
	POP	{ip, pc}	@pop return address into pc 	... ip is register12 ?

