var1		DCD		123456
var1addr	DCD		var1
		
main		MOV		R1, #5
		MOV		R2, #0x0
		MOV		R10, #0b0111	; 7
		MOV		R11, #0b0110	; 6
		MOV		R12, #0b0000	; 0
		
		LDR		R2, =var1 	; load var1 Address to R2
		LDR		R3, =var1addr	; load var1addr Address to R3
		LDR		R4 , [R3]		; load value of R3 -> R4
		LDR		R5 , [R4]		; load value of R4 -> R5
		
		STR		R1, [R2]		; R1->[R2]
		LDR		R0, [R2]		; R0<-[R2]
		
		ADD		R12,R10,R11	; Addition 12 = 7+6 ; R12=R10+R11
		ORR		R12,R10,R11	; Bit wise OR 0b0111 = 0b0111 | 0b0110
