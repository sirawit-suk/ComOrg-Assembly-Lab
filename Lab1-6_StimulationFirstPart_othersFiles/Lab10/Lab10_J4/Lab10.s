	#---
	# data segment
	#---
	.data
	.balign 4
intro:	.asciz	"LED blinking by wiringPi\n"
errMsg:	.asciz	"Setting up problem ... Abort!\n"
pin:	.int	7
i:	.int	0
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
main:	PUSH	{ip, lr}	@push link return register on stack segment
	LDR	R0, =intro
	BL	printf

	BL	wiringPiSetup
	MOV	R1, #-1
	CMP	R0, R1
	BNE	init

	LDR	R0, =errMsg
	BL	printf
	B	done
init:	LDR	R0, =pin
	LDR	R0, [R0]	@ pin 7
	MOV	R1, #OUTPUT	@ set to output
	BL	pinMode		@ pinMode(7,output)

	LDR	R4, =i		@i=0
	LDR	R4, [R4]
	MOV	R5, #10		@ to 10
forLoop:
	CMP	R4, R5		@ i > 10 ?
	BGT	done		@ go to done 

	LDR	R0, =pin	
	LDR	R0, [R0]	@ pin 7
	MOV	R1, #1		@ on
	BL	digitalWrite

	LDR	R0, =duration	
	LDR	R0, [R0]	@ 500
	BL	delay		@ delay 500

	LDR	R0, =pin
	LDR	R0, [R0]	@ pin 7
	MOV	R1, #0		@ off
	BL	digitalWrite

	LDR	R0, =duration
	LDR	R0, [R0]	@ 500
	BL	delay		@ delay 500

	ADD	R4, #1		@ i++
	B	forLoop		@ go back to start loop
done:
	POP	{ip, pc}	@pop return address into pc 	... ip is register12 ? 

