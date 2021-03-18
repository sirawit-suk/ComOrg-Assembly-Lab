	.global main
main:
	MOV	R1, #1
	MOV	R2, #2

	@ Push

	STR	R1, [sp, #-4]!
	STR	R2, [sp, #-4]!

	@ Pop
	
	LDR	R0, [sp], #+4
	LDR	R0, [sp], #+4

end:
	BX LR
