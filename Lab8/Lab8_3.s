	.global main
main:
	MOV	R1, #0
	MOV	R2, #1
	MOV	R4, #2
	MOV	R5, #3

	@ SP	is subtracted by 8 bytes to save R4 and R5, respectively
	@ The ! (Write-Back symbol) updates SP.

	STMDB	SP!, {R4, R5}

	@ Pop (Load)
	LDMIA	SP!, {R1, R2}
	ADD	R0, R1, #0
	ADD	R0, R0, R2

end:
	BX LR
