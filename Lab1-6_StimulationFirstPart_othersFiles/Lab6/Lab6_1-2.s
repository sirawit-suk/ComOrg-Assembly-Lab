		
main		MOV		R5, #10 ; A is true	; second question
		MOV		R4, #-1
		MOV		R6, #2
		MOV		R7, #4
		
if		CMP		R4, #0
		BLE		endl
		
else		MOV		R5, #11 ; B is false
		
		
endl		MOV		R0, R5
		ORR		R8, R6 ,R7
		AND		R9, R6 ,R7	; first question
							; result = 0 
		
		
