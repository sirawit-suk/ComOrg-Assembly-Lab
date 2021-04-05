.global GCD

GCD:
	CMP R0, R1
	BEQ end

	CMP R0, R1
	BLT sub_num1
	SUB R0, R0, R1
	B GCD
sub_num1:
	SUB R1, R1, R0
	B GCD

end:
	BX LR
